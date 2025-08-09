import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

class UpdateBookingUseCase {
  UpdateBookingUseCase({
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository;

  final BookingRepository _bookingRepository;

  Future<Booking> call(String bookingId, BookingUpdateRequest request) async {
    // 既存予約を取得
    final existingBooking = await _bookingRepository.getBookingById(bookingId);
    if (existingBooking == null) {
      throw BookingNotFoundException('予約が見つかりません（ID: $bookingId）');
    }

    // 更新権限チェック
    _validateUpdatePermissions(existingBooking, request);

    // 更新内容バリデーション
    _validateUpdateRequest(existingBooking, request);

    // 更新データを作成
    final updatedBooking = _applyUpdates(existingBooking, request);

    // 予約更新
    return await _bookingRepository.updateBooking(updatedBooking);
  }

  void _validateUpdatePermissions(
      Booking booking, BookingUpdateRequest request) {
    // 顧客IDチェック
    if (booking.customerId != request.customerId) {
      throw BookingUpdateException('他のお客様の予約は変更できません');
    }

    // ステータスによる更新制限
    switch (booking.status) {
      case BookingStatus.completed:
        throw BookingUpdateException('完了済みの予約は変更できません');
      case BookingStatus.cancelled:
        throw BookingUpdateException('キャンセル済みの予約は変更できません');
      case BookingStatus.noShow:
        throw BookingUpdateException('ノーショーの予約は変更できません');
      case BookingStatus.inProgress:
        // 進行中の予約は限定的な更新のみ許可
        _validateInProgressBookingUpdate(request);
        break;
      default:
        // pending, confirmed は通常の更新を許可
        break;
    }

    // 開始時刻までの時間制限チェック
    final timeUntilStart = booking.sittingDateStart.difference(DateTime.now());
    if (timeUntilStart.inHours < 24) {
      // 24時間以内の予約は限定的な更新のみ
      _validateLastMinuteUpdate(request);
    }
  }

  void _validateInProgressBookingUpdate(BookingUpdateRequest request) {
    // 進行中の予約で更新可能な項目を制限
    if (request.startDate != null ||
        request.endDate != null ||
        request.serviceType != null ||
        request.petIds != null) {
      throw BookingUpdateException('進行中の予約では日時、サービスタイプ、ペットの変更はできません');
    }
  }

  void _validateLastMinuteUpdate(BookingUpdateRequest request) {
    // 24時間以内の予約変更制限
    if (request.startDate != null || request.endDate != null) {
      throw BookingUpdateException('24時間以内の予約では日時の変更はできません');
    }
  }

  void _validateUpdateRequest(Booking booking, BookingUpdateRequest request) {
    // 日付バリデーション
    if (request.startDate != null && request.endDate != null) {
      if (request.startDate!.isAfter(request.endDate!)) {
        throw BookingUpdateException('開始日は終了日より前に設定してください');
      }
    }

    if (request.startDate != null) {
      final endDate = request.endDate ?? booking.sittingDateEnd;
      if (request.startDate!.isAfter(endDate)) {
        throw BookingUpdateException('開始日は終了日より前に設定してください');
      }

      if (request.startDate!.isBefore(DateTime.now())) {
        throw BookingUpdateException('開始日は現在時刻より後に設定してください');
      }
    }

    if (request.endDate != null) {
      final startDate = request.startDate ?? booking.sittingDateStart;
      if (request.endDate!.isBefore(startDate)) {
        throw BookingUpdateException('終了日は開始日より後に設定してください');
      }
    }

    // ペットIDバリデーション
    if (request.petIds != null && request.petIds!.isEmpty) {
      throw BookingUpdateException('少なくとも1匹のペットを選択してください');
    }
  }

  Booking _applyUpdates(Booking booking, BookingUpdateRequest request) {
    return booking.copyWith(
      sittingDateStart: request.startDate ?? booking.sittingDateStart,
      sittingDateEnd: request.endDate ?? booking.sittingDateEnd,
      serviceType: request.serviceType ?? booking.serviceType,
      petIds: request.petIds ?? booking.petIds,
      notes: request.notes ?? booking.notes,
      ownerNotes: request.ownerNotes ?? booking.ownerNotes,
      specialInstructions:
          request.specialInstructions ?? booking.specialInstructions,
      pricing: request.pricing ?? booking.pricing,
      updatedAt: DateTime.now(),
    );
  }
}

class BookingUpdateRequest {
  BookingUpdateRequest({
    required this.customerId,
    this.startDate,
    this.endDate,
    this.serviceType,
    this.petIds,
    this.notes,
    this.ownerNotes,
    this.specialInstructions,
    this.pricing,
  });

  final String customerId;
  final DateTime? startDate;
  final DateTime? endDate;
  final ServiceType? serviceType;
  final List<String>? petIds;
  final String? notes;
  final String? ownerNotes;
  final List<String>? specialInstructions;
  final BookingPricing? pricing;
}

class BookingNotFoundException implements Exception {
  BookingNotFoundException(this.message);

  final String message;

  @override
  String toString() => 'BookingNotFoundException: $message';
}

class BookingUpdateException implements Exception {
  BookingUpdateException(this.message);

  final String message;

  @override
  String toString() => 'BookingUpdateException: $message';
}
