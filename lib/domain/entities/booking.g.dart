// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      sittingDateStart: DateTime.parse(json['sittingDateStart'] as String),
      sittingDateEnd: DateTime.parse(json['sittingDateEnd'] as String),
      status: $enumDecodeNullable(_$BookingStatusEnumMap, json['status']) ??
          BookingStatus.pending,
      serviceType:
          $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']) ??
              ServiceType.visiting,
      staffId: json['staffId'] as String?,
      petId: json['petId'] as String?,
      petIds: (json['petIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notes: json['notes'] as String?,
      ownerNotes: json['ownerNotes'] as String?,
      staffNotes: json['staffNotes'] as String?,
      specialInstructions: (json['specialInstructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pricing: json['pricing'] == null
          ? null
          : BookingPricing.fromJson(json['pricing'] as Map<String, dynamic>),
      communicationLog: (json['communicationLog'] as List<dynamic>?)
              ?.map((e) =>
                  CommunicationMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ownerRating: json['ownerRating'] == null
          ? null
          : BookingRating.fromJson(json['ownerRating'] as Map<String, dynamic>),
      serviceReports: (json['serviceReports'] as List<dynamic>?)
              ?.map((e) => ServiceReport.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      photoUrls: (json['photoUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cancelReason: json['cancelReason'] as String?,
      createdVia: json['createdVia'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'sittingDateStart': instance.sittingDateStart.toIso8601String(),
      'sittingDateEnd': instance.sittingDateEnd.toIso8601String(),
      'status': _$BookingStatusEnumMap[instance.status]!,
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
      'staffId': instance.staffId,
      'petId': instance.petId,
      'petIds': instance.petIds,
      'notes': instance.notes,
      'ownerNotes': instance.ownerNotes,
      'staffNotes': instance.staffNotes,
      'specialInstructions': instance.specialInstructions,
      'pricing': instance.pricing,
      'communicationLog': instance.communicationLog,
      'ownerRating': instance.ownerRating,
      'serviceReports': instance.serviceReports,
      'photoUrls': instance.photoUrls,
      'cancelReason': instance.cancelReason,
      'createdVia': instance.createdVia,
      'lastModifiedBy': instance.lastModifiedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.inProgress: 'inProgress',
  BookingStatus.completed: 'completed',
  BookingStatus.cancelled: 'cancelled',
  BookingStatus.noShow: 'noShow',
};

const _$ServiceTypeEnumMap = {
  ServiceType.visiting: 'visiting',
  ServiceType.boarding: 'boarding',
  ServiceType.daycare: 'daycare',
  ServiceType.grooming: 'grooming',
  ServiceType.walking: 'walking',
};

_$BookingPricingImpl _$$BookingPricingImplFromJson(Map<String, dynamic> json) =>
    _$BookingPricingImpl(
      basePrice: (json['basePrice'] as num).toDouble(),
      additionalCharges: (json['additionalCharges'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      currency: json['currency'] as String?,
      priceBreakdown: json['priceBreakdown'] as String?,
    );

Map<String, dynamic> _$$BookingPricingImplToJson(
        _$BookingPricingImpl instance) =>
    <String, dynamic>{
      'basePrice': instance.basePrice,
      'additionalCharges': instance.additionalCharges,
      'discount': instance.discount,
      'tax': instance.tax,
      'totalPrice': instance.totalPrice,
      'currency': instance.currency,
      'priceBreakdown': instance.priceBreakdown,
    };

_$CommunicationMessageImpl _$$CommunicationMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunicationMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderType: json['senderType'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      messageType: json['messageType'] as String? ?? 'text',
      isRead: json['isRead'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CommunicationMessageImplToJson(
        _$CommunicationMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderType': instance.senderType,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'messageType': instance.messageType,
      'isRead': instance.isRead,
      'imageUrl': instance.imageUrl,
      'metadata': instance.metadata,
    };

_$BookingRatingImpl _$$BookingRatingImplFromJson(Map<String, dynamic> json) =>
    _$BookingRatingImpl(
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String?,
      ratedAt: json['ratedAt'] == null
          ? null
          : DateTime.parse(json['ratedAt'] as String),
      categoryRatings: (json['categoryRatings'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$BookingRatingImplToJson(_$BookingRatingImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'ratedAt': instance.ratedAt?.toIso8601String(),
      'categoryRatings': instance.categoryRatings,
    };

_$ServiceReportImpl _$$ServiceReportImplFromJson(Map<String, dynamic> json) =>
    _$ServiceReportImpl(
      id: json['id'] as String,
      bookingId: json['bookingId'] as String,
      reportDate: DateTime.parse(json['reportDate'] as String),
      staffId: json['staffId'] as String,
      summary: json['summary'] as String?,
      activities: json['activities'] as String?,
      petBehavior: json['petBehavior'] as String?,
      healthNotes: json['healthNotes'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ServiceReportImplToJson(_$ServiceReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'reportDate': instance.reportDate.toIso8601String(),
      'staffId': instance.staffId,
      'summary': instance.summary,
      'activities': instance.activities,
      'petBehavior': instance.petBehavior,
      'healthNotes': instance.healthNotes,
      'photoUrls': instance.photoUrls,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$BookingRequestImpl _$$BookingRequestImplFromJson(Map<String, dynamic> json) =>
    _$BookingRequestImpl(
      customerId: json['customerId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
      petIds: (json['petIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notes: json['notes'] as String?,
      specialInstructions: (json['specialInstructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredStaffId: json['preferredStaffId'] as String?,
    );

Map<String, dynamic> _$$BookingRequestImplToJson(
        _$BookingRequestImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
      'petIds': instance.petIds,
      'notes': instance.notes,
      'specialInstructions': instance.specialInstructions,
      'preferredStaffId': instance.preferredStaffId,
    };
