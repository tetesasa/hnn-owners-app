// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationResultImpl _$$AuthenticationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationResultImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      status:
          $enumDecodeNullable(_$AuthenticationStatusEnumMap, json['status']) ??
              AuthenticationStatus.success,
      message: json['message'] as String?,
      requiresCustomerLinking: json['requiresCustomerLinking'] as bool?,
      potentialMatches: (json['potentialMatches'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AuthenticationResultImplToJson(
        _$AuthenticationResultImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'customer': instance.customer,
      'profile': instance.profile,
      'status': _$AuthenticationStatusEnumMap[instance.status]!,
      'message': instance.message,
      'requiresCustomerLinking': instance.requiresCustomerLinking,
      'potentialMatches': instance.potentialMatches,
    };

const _$AuthenticationStatusEnumMap = {
  AuthenticationStatus.success: 'success',
  AuthenticationStatus.failure: 'failure',
  AuthenticationStatus.customerNotFound: 'customerNotFound',
  AuthenticationStatus.multipleMatchesFound: 'multipleMatchesFound',
  AuthenticationStatus.pendingApproval: 'pendingApproval',
  AuthenticationStatus.emailNotVerified: 'emailNotVerified',
  AuthenticationStatus.accountDisabled: 'accountDisabled',
  AuthenticationStatus.requiresAdditionalInfo: 'requiresAdditionalInfo',
};

_$SignInRequestImpl _$$SignInRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignInRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$SignInRequestImplToJson(_$SignInRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$SignUpRequestImpl _$$SignUpRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignUpRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$SignUpRequestImplToJson(_$SignUpRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };

_$CustomerLinkingRequestImpl _$$CustomerLinkingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerLinkingRequestImpl(
      firebaseUid: json['firebaseUid'] as String,
      customerId: json['customerId'] as String,
      additionalInfo: json['additionalInfo'] as String?,
    );

Map<String, dynamic> _$$CustomerLinkingRequestImplToJson(
        _$CustomerLinkingRequestImpl instance) =>
    <String, dynamic>{
      'firebaseUid': instance.firebaseUid,
      'customerId': instance.customerId,
      'additionalInfo': instance.additionalInfo,
    };
