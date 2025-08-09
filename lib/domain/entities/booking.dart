import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

enum BookingStatus {
  pending('pending'),
  confirmed('confirmed'),
  inProgress('in_progress'),
  completed('completed'),
  cancelled('cancelled'),
  noShow('no_show');

  const BookingStatus(this.value);
  final String value;

  static BookingStatus fromString(String value) {
    return BookingStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => BookingStatus.pending,
    );
  }

  @override
  String toString() => value;
}

enum ServiceType {
  visiting('visiting'),
  boarding('boarding'),
  daycare('daycare'),
  grooming('grooming'),
  walking('walking');

  const ServiceType(this.value);
  final String value;

  static ServiceType fromString(String value) {
    return ServiceType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ServiceType.visiting,
    );
  }

  @override
  String toString() => value;
}

@freezed
class Booking with _$Booking {
  const Booking._();

  const factory Booking({
    required String id,
    required String customerId,
    required DateTime sittingDateStart,
    required DateTime sittingDateEnd,
    @Default(BookingStatus.pending) BookingStatus status,
    @Default(ServiceType.visiting) ServiceType serviceType,
    String? staffId,
    String? petId,
    @Default([]) List<String> petIds,
    String? notes,
    String? ownerNotes,
    String? staffNotes,
    @Default([]) List<String> specialInstructions,
    BookingPricing? pricing,
    @Default([]) List<CommunicationMessage> communicationLog,
    BookingRating? ownerRating,
    @Default([]) List<ServiceReport> serviceReports,
    @Default([]) List<String> photoUrls,
    String? cancelReason,
    String? createdVia,
    String? lastModifiedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  factory Booking.fromFirestore(Map<String, dynamic> data) {
    return Booking(
      id: data['ID'] ?? '',
      customerId: data['customerId'] ?? data['CUSTOMER_ID'] ?? '',
      sittingDateStart: _parseDateTime(
          data['sittingDateStart'] ?? data['SITTING_DATE_START']),
      sittingDateEnd:
          _parseDateTime(data['sittingDateEnd'] ?? data['SITTING_DATE_END']),
      status: BookingStatus.fromString(data['status'] ?? 'pending'),
      serviceType: ServiceType.fromString(data['serviceType'] ?? 'visiting'),
      staffId: data['staffId'],
      petId: data['petId'],
      petIds: List<String>.from(data['petIds'] ?? []),
      notes: data['notes'],
      ownerNotes: data['ownerNotes'],
      staffNotes: data['staffNotes'],
      specialInstructions: List<String>.from(data['specialInstructions'] ?? []),
      pricing: data['pricing'] != null
          ? BookingPricing.fromJson(Map<String, dynamic>.from(data['pricing']))
          : null,
      communicationLog: (data['communicationLog'] as List<dynamic>?)
              ?.map((e) =>
                  CommunicationMessage.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      ownerRating: data['ownerRating'] != null
          ? BookingRating.fromJson(
              Map<String, dynamic>.from(data['ownerRating']))
          : null,
      serviceReports: (data['serviceReports'] as List<dynamic>?)
              ?.map((e) => ServiceReport.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      photoUrls: List<String>.from(data['photoUrls'] ?? []),
      cancelReason: data['cancelReason'],
      createdVia: data['createdVia'],
      lastModifiedBy: data['lastModifiedBy'],
      createdAt: _parseDateTime(data['createdAt'] ?? data['CREATED_AT']),
      updatedAt: _parseDateTime(data['updatedAt'] ?? data['UPDATED_AT']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'ID': id,
      'customerId': customerId,
      'CUSTOMER_ID': customerId,
      'sittingDateStart': sittingDateStart.toIso8601String(),
      'SITTING_DATE_START': sittingDateStart.toIso8601String(),
      'sittingDateEnd': sittingDateEnd.toIso8601String(),
      'SITTING_DATE_END': sittingDateEnd.toIso8601String(),
      'status': status.value,
      'serviceType': serviceType.value,
      'staffId': staffId,
      'petId': petId,
      'petIds': petIds,
      'notes': notes,
      'ownerNotes': ownerNotes,
      'staffNotes': staffNotes,
      'specialInstructions': specialInstructions,
      'pricing': pricing?.toJson(),
      'communicationLog': communicationLog.map((e) => e.toJson()).toList(),
      'ownerRating': ownerRating?.toJson(),
      'serviceReports': serviceReports.map((e) => e.toJson()).toList(),
      'photoUrls': photoUrls,
      'cancelReason': cancelReason,
      'createdVia': createdVia,
      'lastModifiedBy': lastModifiedBy,
      'createdAt': createdAt?.toIso8601String(),
      'CREATED_AT': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'UPDATED_AT': updatedAt?.toIso8601String(),
    };
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) return DateTime.parse(value);
    return DateTime.now();
  }
}

@freezed
class BookingPricing with _$BookingPricing {
  const factory BookingPricing({
    required double basePrice,
    @Default(0.0) double additionalCharges,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    required double totalPrice,
    String? currency,
    String? priceBreakdown,
  }) = _BookingPricing;

  factory BookingPricing.fromJson(Map<String, dynamic> json) =>
      _$BookingPricingFromJson(json);
}

@freezed
class CommunicationMessage with _$CommunicationMessage {
  const factory CommunicationMessage({
    required String id,
    required String senderId,
    required String senderType, // 'owner' | 'staff' | 'system'
    required String message,
    required DateTime timestamp,
    @Default('text') String messageType, // 'text' | 'image' | 'system'
    @Default(false) bool isRead,
    String? imageUrl,
    Map<String, dynamic>? metadata,
  }) = _CommunicationMessage;

  factory CommunicationMessage.fromJson(Map<String, dynamic> json) =>
      _$CommunicationMessageFromJson(json);
}

@freezed
class BookingRating with _$BookingRating {
  const factory BookingRating({
    required int rating, // 1-5
    String? comment,
    DateTime? ratedAt,
    @Default({})
    Map<String, int> categoryRatings, // {'reliability': 5, 'communication': 4}
  }) = _BookingRating;

  factory BookingRating.fromJson(Map<String, dynamic> json) =>
      _$BookingRatingFromJson(json);
}

@freezed
class ServiceReport with _$ServiceReport {
  const factory ServiceReport({
    required String id,
    required String bookingId,
    required DateTime reportDate,
    required String staffId,
    String? summary,
    String? activities,
    String? petBehavior,
    String? healthNotes,
    @Default([]) List<String> photoUrls,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ServiceReport;

  factory ServiceReport.fromJson(Map<String, dynamic> json) =>
      _$ServiceReportFromJson(json);
}

@freezed
class BookingRequest with _$BookingRequest {
  const factory BookingRequest({
    required String customerId,
    required DateTime startDate,
    required DateTime endDate,
    required ServiceType serviceType,
    @Default([]) List<String> petIds,
    String? notes,
    @Default([]) List<String> specialInstructions,
    String? preferredStaffId,
  }) = _BookingRequest;

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);
}
