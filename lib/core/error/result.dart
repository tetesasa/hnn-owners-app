import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppError error) = Failure<T>;
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => when(
        success: (data) => data,
        failure: (_) => null,
      );

  AppError? get error => when(
        success: (_) => null,
        failure: (error) => error,
      );

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(AppError error) onFailure,
  }) {
    return when(
      success: onSuccess,
      failure: onFailure,
    );
  }
}

@freezed
class AppError with _$AppError {
  const factory AppError({
    required String message,
    String? code,
    Exception? exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? details,
  }) = _AppError;

  const factory AppError.network({
    required String message,
    String? code,
    Exception? exception,
  }) = NetworkError;

  const factory AppError.validation({
    required String message,
    String? field,
    Map<String, dynamic>? details,
  }) = ValidationError;

  const factory AppError.authentication({
    required String message,
    String? code,
  }) = AuthenticationError;

  const factory AppError.permission({
    required String message,
    String? resource,
  }) = PermissionError;

  const factory AppError.payment({
    required String message,
    String? code,
    String? paymentIntentId,
    Map<String, dynamic>? details,
  }) = PaymentError;

  const factory AppError.unknown({
    required String message,
    Exception? exception,
    StackTrace? stackTrace,
  }) = UnknownError;
}
