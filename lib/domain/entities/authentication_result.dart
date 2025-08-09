import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import 'customer.dart';

part 'authentication_result.freezed.dart';
part 'authentication_result.g.dart';

@freezed
class AuthenticationResult with _$AuthenticationResult {
  const factory AuthenticationResult({
    required User user,
    Customer? customer,
    UserProfile? profile,
    @Default(AuthenticationStatus.success) AuthenticationStatus status,
    String? message,
    bool? requiresCustomerLinking,
    List<Customer>? potentialMatches,
  }) = _AuthenticationResult;

  factory AuthenticationResult.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResultFromJson(json);
}

enum AuthenticationStatus {
  success,
  failure,
  customerNotFound,
  multipleMatchesFound,
  pendingApproval,
  emailNotVerified,
  accountDisabled,
  requiresAdditionalInfo,
}

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    required String email,
    required String password,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    required String email,
    required String password,
    required String name,
    required String phone,
    String? address,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}

@freezed
class CustomerLinkingRequest with _$CustomerLinkingRequest {
  const factory CustomerLinkingRequest({
    required String firebaseUid,
    required String customerId,
    String? additionalInfo,
  }) = _CustomerLinkingRequest;

  factory CustomerLinkingRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerLinkingRequestFromJson(json);
}
