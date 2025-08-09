import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/invoice.dart';
import '../../domain/repositories/invoice_repository.dart';
import '../../../../core/error/result.dart';

part 'firestore_invoice_repository.g.dart';

class FirestoreInvoiceRepository implements InvoiceRepository {
  final FirebaseFirestore _firestore;

  FirestoreInvoiceRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<Invoice>> createInvoice({
    required String customerId,
    required String bookingId,
    required List<InvoiceLineItem> lineItems,
    String? description,
    DateTime? dueDate,
    InvoiceBilling? billing,
    Map<String, String>? metadata,
  }) async {
    try {
      final docRef = _firestore.collection('INVOICES').doc();

      // 合計金額の計算
      final totalAmount = lineItems.fold<int>(
        0,
        (total, item) => total + item.totalAmount,
      );

      final invoice = Invoice(
        id: docRef.id,
        customerId: customerId,
        bookingId: bookingId,
        amount: totalAmount,
        currency: 'jpy',
        status: InvoiceStatus.draft,
        description: description,
        lineItems: lineItems,
        billing: billing,
        dueDate: dueDate,
        created: DateTime.now(),
        updated: DateTime.now(),
        metadata: metadata,
      );

      await docRef.set(invoice.toFirestore());

      return Result.success(invoice);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書の作成中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<Invoice>> getInvoice(String invoiceId) async {
    try {
      final doc = await _firestore.collection('INVOICES').doc(invoiceId).get();

      if (!doc.exists) {
        return Result.failure(const AppError.validation(
          message: '指定された請求書が見つかりません',
          field: 'invoiceId',
        ));
      }

      final invoice = Invoice.fromFirestore(doc.data()!);
      return Result.success(invoice);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<List<Invoice>>> getCustomerInvoices({
    required String customerId,
    InvoiceStatus? status,
    int? limit,
    String? startingAfter,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore
          .collection('INVOICES')
          .where('customerId', isEqualTo: customerId)
          .orderBy('created', descending: true);

      if (status != null) {
        query = query.where('status', isEqualTo: status.name);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      if (startingAfter != null) {
        final startDoc =
            await _firestore.collection('INVOICES').doc(startingAfter).get();
        if (startDoc.exists) {
          query = query.startAfterDocument(startDoc);
        }
      }

      final querySnapshot = await query.get();

      final invoices = querySnapshot.docs
          .map((doc) => Invoice.fromFirestore(doc.data()))
          .toList();

      return Result.success(invoices);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書一覧の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<Invoice?>> getBookingInvoice(String bookingId) async {
    try {
      final querySnapshot = await _firestore
          .collection('INVOICES')
          .where('bookingId', isEqualTo: bookingId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.success(null);
      }

      final invoice = Invoice.fromFirestore(querySnapshot.docs.first.data());
      return Result.success(invoice);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '予約に関連する請求書の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<Invoice>> updateInvoice({
    required String invoiceId,
    String? description,
    DateTime? dueDate,
    InvoiceBilling? billing,
    Map<String, String>? metadata,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'updated': DateTime.now().toIso8601String(),
      };

      if (description != null) updateData['description'] = description;
      if (dueDate != null) updateData['dueDate'] = dueDate.toIso8601String();
      if (billing != null) updateData['billing'] = billing.toFirestore();
      if (metadata != null) updateData['metadata'] = metadata;

      await _firestore.collection('INVOICES').doc(invoiceId).update(updateData);

      // 更新された請求書を取得して返す
      final result = await getInvoice(invoiceId);
      return result;
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書の更新中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<void>> deleteInvoice(String invoiceId) async {
    try {
      await _firestore.collection('INVOICES').doc(invoiceId).delete();
      return const Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書の削除中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<Invoice>> updateInvoiceStatus({
    required String invoiceId,
    required InvoiceStatus status,
    DateTime? paidAt,
    String? paymentIntentId,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'status': status.name,
        'updated': DateTime.now().toIso8601String(),
      };

      if (paidAt != null) {
        updateData['paidAt'] = paidAt.toIso8601String();
      }

      if (paymentIntentId != null) {
        updateData['paymentIntentId'] = paymentIntentId;
      }

      await _firestore.collection('INVOICES').doc(invoiceId).update(updateData);

      // 更新された請求書を取得して返す
      final result = await getInvoice(invoiceId);
      return result;
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書ステータスの更新中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<void>> sendInvoice({
    required String invoiceId,
    String? email,
  }) async {
    try {
      // 請求書送信機能は後で実装
      // Cloud Functionsまたはメール送信サービスと連携
      throw UnimplementedError('Invoice sending not implemented yet');
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '請求書の送信中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<String>> generateInvoicePDF(String invoiceId) async {
    try {
      // PDF生成機能は後で実装
      // Cloud Functionsまたはサーバーサイドで処理
      throw UnimplementedError('PDF generation not implemented yet');
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: 'PDFの生成中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<List<Invoice>>> getOverdueInvoices({
    String? customerId,
    int? limit,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore
          .collection('INVOICES')
          .where('status', isEqualTo: InvoiceStatus.open.name)
          .where('dueDate', isLessThan: DateTime.now().toIso8601String())
          .orderBy('dueDate');

      if (customerId != null) {
        query = query.where('customerId', isEqualTo: customerId);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      final querySnapshot = await query.get();

      final invoices = querySnapshot.docs
          .map((doc) => Invoice.fromFirestore(doc.data()))
          .toList();

      return Result.success(invoices);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '期限切れ請求書の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getRevenueStats({
    required DateTime startDate,
    required DateTime endDate,
    String? customerId,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore
          .collection('INVOICES')
          .where('status', isEqualTo: InvoiceStatus.paid.name)
          .where('paidAt', isGreaterThanOrEqualTo: startDate.toIso8601String())
          .where('paidAt', isLessThanOrEqualTo: endDate.toIso8601String());

      if (customerId != null) {
        query = query.where('customerId', isEqualTo: customerId);
      }

      final querySnapshot = await query.get();

      final invoices = querySnapshot.docs
          .map((doc) => Invoice.fromFirestore(doc.data()))
          .toList();

      final totalRevenue = invoices.fold<int>(
        0,
        (total, invoice) => total + invoice.amount,
      );

      final stats = {
        'totalRevenue': totalRevenue,
        'totalInvoices': invoices.length,
        'averageAmount':
            invoices.isNotEmpty ? totalRevenue / invoices.length : 0,
        'period': {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      };

      return Result.success(stats);
    } on FirebaseException catch (e) {
      return Result.failure(AppError.network(
        message: 'データベースエラーが発生しました: ${e.message}',
        code: e.code,
        exception: e,
      ));
    } catch (e) {
      return Result.failure(AppError.unknown(
        message: '売上統計の取得中にエラーが発生しました',
        exception: e is Exception ? e : Exception(e.toString()),
      ));
    }
  }
}

@riverpod
InvoiceRepository invoiceRepository(Ref ref) {
  return FirestoreInvoiceRepository();
}
