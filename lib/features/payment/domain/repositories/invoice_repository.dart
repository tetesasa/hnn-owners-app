import '../entities/invoice.dart';
import '../../../../core/error/result.dart';

abstract class InvoiceRepository {
  // Invoice作成
  Future<Result<Invoice>> createInvoice({
    required String customerId,
    required String bookingId,
    required List<InvoiceLineItem> lineItems,
    String? description,
    DateTime? dueDate,
    InvoiceBilling? billing,
    Map<String, String>? metadata,
  });

  // Invoice取得
  Future<Result<Invoice>> getInvoice(String invoiceId);

  // Customer別Invoice一覧取得
  Future<Result<List<Invoice>>> getCustomerInvoices({
    required String customerId,
    InvoiceStatus? status,
    int? limit,
    String? startingAfter,
  });

  // Booking別Invoice取得
  Future<Result<Invoice?>> getBookingInvoice(String bookingId);

  // Invoice更新
  Future<Result<Invoice>> updateInvoice({
    required String invoiceId,
    String? description,
    DateTime? dueDate,
    InvoiceBilling? billing,
    Map<String, String>? metadata,
  });

  // Invoice削除
  Future<Result<void>> deleteInvoice(String invoiceId);

  // Invoice状態更新
  Future<Result<Invoice>> updateInvoiceStatus({
    required String invoiceId,
    required InvoiceStatus status,
    DateTime? paidAt,
    String? paymentIntentId,
  });

  // Invoice送信
  Future<Result<void>> sendInvoice({
    required String invoiceId,
    String? email,
  });

  // Invoice PDF生成
  Future<Result<String>> generateInvoicePDF(String invoiceId);

  // 期限切れInvoice取得
  Future<Result<List<Invoice>>> getOverdueInvoices({
    String? customerId,
    int? limit,
  });

  // 売上統計
  Future<Result<Map<String, dynamic>>> getRevenueStats({
    required DateTime startDate,
    required DateTime endDate,
    String? customerId,
  });
}
