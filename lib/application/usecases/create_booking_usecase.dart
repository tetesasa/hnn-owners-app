import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../domain/repositories/pet_repository.dart';

class CreateBookingUseCase {
  CreateBookingUseCase({
    required BookingRepository bookingRepository,
    required PetRepository petRepository,
  })  : _bookingRepository = bookingRepository,
        _petRepository = petRepository;

  final BookingRepository _bookingRepository;
  final PetRepository _petRepository;

  Future<Booking> call(BookingRequest request) async {
    // バリデーション
    await _validateBookingRequest(request);

    // 予約作成
    final booking = await _bookingRepository.createBooking(request);

    return booking;
  }

  Future<void> _validateBookingRequest(BookingRequest request) async {
    // 日付バリデーション
    if (request.startDate.isAfter(request.endDate)) {
      throw BookingValidationException('開始日は終了日より前に設定してください');
    }

    if (request.startDate.isBefore(DateTime.now())) {
      throw BookingValidationException('開始日は現在時刻より後に設定してください');
    }

    // ペット存在確認
    if (request.petIds.isEmpty) {
      throw BookingValidationException('少なくとも1匹のペットを選択してください');
    }

    for (final petId in request.petIds) {
      final pet = await _petRepository.getPetById(petId);
      if (pet == null) {
        throw BookingValidationException('選択されたペット（ID: $petId）が見つかりません');
      }

      // ペットの所有者確認
      if (pet.customerId != request.customerId) {
        throw BookingValidationException('他のお客様のペットは予約できません');
      }
    }

    // サービスタイプ別バリデーション
    switch (request.serviceType) {
      case ServiceType.visiting:
        _validateVisitingService(request);
        break;
      case ServiceType.boarding:
        _validateBoardingService(request);
        break;
      case ServiceType.daycare:
        _validateDaycareService(request);
        break;
      case ServiceType.grooming:
        _validateGroomingService(request);
        break;
      case ServiceType.walking:
        _validateWalkingService(request);
        break;
      // veterinaryとemergencyは存在しないためコメントアウト
      // case ServiceType.veterinary:
      //   _validateVeterinaryService(request);
      //   break;
      // case ServiceType.emergency:
      //   _validateEmergencyService(request);
      //   break;
    }
  }

  void _validateVisitingService(BookingRequest request) {
    // 訪問サービスの最小時間チェック（2時間）
    final duration = request.endDate.difference(request.startDate);
    if (duration.inHours < 2) {
      throw BookingValidationException('訪問サービスは最低2時間からご利用いただけます');
    }
  }

  void _validateBoardingService(BookingRequest request) {
    // 宿泊サービスの最小期間チェック（1日）
    final duration = request.endDate.difference(request.startDate);
    if (duration.inDays < 1) {
      throw BookingValidationException('宿泊サービスは最低1日からご利用いただけます');
    }
  }

  void _validateDaycareService(BookingRequest request) {
    // デイケアサービスの時間チェック（営業時間内）
    final startHour = request.startDate.hour;
    final endHour = request.endDate.hour;

    if (startHour < 8 || startHour > 18 || endHour < 8 || endHour > 18) {
      throw BookingValidationException('デイケアサービスの営業時間は8:00〜18:00です');
    }
  }

  void _validateGroomingService(BookingRequest request) {
    // グルーミングサービスの時間チェック
    final duration = request.endDate.difference(request.startDate);
    if (duration.inHours < 1 || duration.inHours > 4) {
      throw BookingValidationException('グルーミングサービスは1〜4時間の範囲で設定してください');
    }
  }

  void _validateWalkingService(BookingRequest request) {
    // お散歩サービスの時間チェック
    final duration = request.endDate.difference(request.startDate);
    if (duration.inMinutes < 30 || duration.inHours > 3) {
      throw BookingValidationException('お散歩サービスは30分〜3時間の範囲で設定してください');
    }
  }

  // veterinaryとemergencyのServiceTypeが存在しないためコメントアウト
  // void _validateVeterinaryService(BookingRequest request) {
  //   // 獣医サービスの時間チェック
  //   final duration = request.endDate.difference(request.startDate);
  //   if (duration.inMinutes < 30 || duration.inHours > 2) {
  //     throw BookingValidationException('獣医サービスは30分〜2時間の範囲で設定してください');
  //   }
  // }

  // void _validateEmergencyService(BookingRequest request) {
  //   // 緊急サービスは24時間対応だが、現在時刻から12時間以内に開始する必要がある
  //   final timeDiff = request.startDate.difference(DateTime.now());
  //   if (timeDiff.inHours > 12) {
  //     throw BookingValidationException('緊急サービスは12時間以内に開始してください');
  //   }
  // }
}

class BookingValidationException implements Exception {
  BookingValidationException(this.message);

  final String message;

  @override
  String toString() => 'BookingValidationException: $message';
}
