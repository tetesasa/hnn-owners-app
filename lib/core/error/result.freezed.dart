// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppError error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(AppError error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppError error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res, Result<T>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res, $Val extends Result<T>>
    implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppError error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(AppError error)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppError error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements Result<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res> get error {
    return $AppErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$FailureImpl<T> implements Failure<T> {
  const _$FailureImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'Result<$T>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppError error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(AppError error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppError error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements Result<T> {
  const factory Failure(final AppError error) = _$FailureImpl<T>;

  AppError get error;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$AppErrorImplCopyWith(
          _$AppErrorImpl value, $Res Function(_$AppErrorImpl) then) =
      __$$AppErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? code,
      Exception? exception,
      StackTrace? stackTrace,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$AppErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AppErrorImpl>
    implements _$$AppErrorImplCopyWith<$Res> {
  __$$AppErrorImplCopyWithImpl(
      _$AppErrorImpl _value, $Res Function(_$AppErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? exception = freezed,
    Object? stackTrace = freezed,
    Object? details = freezed,
  }) {
    return _then(_$AppErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$AppErrorImpl implements _AppError {
  const _$AppErrorImpl(
      {required this.message,
      this.code,
      this.exception,
      this.stackTrace,
      final Map<String, dynamic>? details})
      : _details = details;

  @override
  final String message;
  @override
  final String? code;
  @override
  final Exception? exception;
  @override
  final StackTrace? stackTrace;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppError(message: $message, code: $code, exception: $exception, stackTrace: $stackTrace, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, exception,
      stackTrace, const DeepCollectionEquality().hash(_details));

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      __$$AppErrorImplCopyWithImpl<_$AppErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return $default(message, code, exception, stackTrace, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return $default?.call(message, code, exception, stackTrace, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message, code, exception, stackTrace, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AppError implements AppError {
  const factory _AppError(
      {required final String message,
      final String? code,
      final Exception? exception,
      final StackTrace? stackTrace,
      final Map<String, dynamic>? details}) = _$AppErrorImpl;

  @override
  String get message;
  String? get code;
  Exception? get exception;
  StackTrace? get stackTrace;
  Map<String, dynamic>? get details;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, Exception? exception});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl({required this.message, this.code, this.exception});

  @override
  final String message;
  @override
  final String? code;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'AppError.network(message: $message, code: $code, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, exception);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return network(message, code, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return network?.call(message, code, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, code, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AppError {
  const factory NetworkError(
      {required final String message,
      final String? code,
      final Exception? exception}) = _$NetworkErrorImpl;

  @override
  String get message;
  String? get code;
  Exception? get exception;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? field, Map<String, dynamic>? details});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? field = freezed,
    Object? details = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorImpl implements ValidationError {
  const _$ValidationErrorImpl(
      {required this.message, this.field, final Map<String, dynamic>? details})
      : _details = details;

  @override
  final String message;
  @override
  final String? field;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppError.validation(message: $message, field: $field, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, field,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return validation(message, field, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return validation?.call(message, field, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, field, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationError implements AppError {
  const factory ValidationError(
      {required final String message,
      final String? field,
      final Map<String, dynamic>? details}) = _$ValidationErrorImpl;

  @override
  String get message;
  String? get field;
  Map<String, dynamic>? get details;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$AuthenticationErrorImplCopyWith(_$AuthenticationErrorImpl value,
          $Res Function(_$AuthenticationErrorImpl) then) =
      __$$AuthenticationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$AuthenticationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AuthenticationErrorImpl>
    implements _$$AuthenticationErrorImplCopyWith<$Res> {
  __$$AuthenticationErrorImplCopyWithImpl(_$AuthenticationErrorImpl _value,
      $Res Function(_$AuthenticationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$AuthenticationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthenticationErrorImpl implements AuthenticationError {
  const _$AuthenticationErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AppError.authentication(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationErrorImplCopyWith<_$AuthenticationErrorImpl> get copyWith =>
      __$$AuthenticationErrorImplCopyWithImpl<_$AuthenticationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return authentication(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return authentication?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return authentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class AuthenticationError implements AppError {
  const factory AuthenticationError(
      {required final String message,
      final String? code}) = _$AuthenticationErrorImpl;

  @override
  String get message;
  String? get code;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationErrorImplCopyWith<_$AuthenticationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$PermissionErrorImplCopyWith(_$PermissionErrorImpl value,
          $Res Function(_$PermissionErrorImpl) then) =
      __$$PermissionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? resource});
}

/// @nodoc
class __$$PermissionErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$PermissionErrorImpl>
    implements _$$PermissionErrorImplCopyWith<$Res> {
  __$$PermissionErrorImplCopyWithImpl(
      _$PermissionErrorImpl _value, $Res Function(_$PermissionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? resource = freezed,
  }) {
    return _then(_$PermissionErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PermissionErrorImpl implements PermissionError {
  const _$PermissionErrorImpl({required this.message, this.resource});

  @override
  final String message;
  @override
  final String? resource;

  @override
  String toString() {
    return 'AppError.permission(message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, resource);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionErrorImplCopyWith<_$PermissionErrorImpl> get copyWith =>
      __$$PermissionErrorImplCopyWithImpl<_$PermissionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return permission(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return permission?.call(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(message, resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return permission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return permission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this);
    }
    return orElse();
  }
}

abstract class PermissionError implements AppError {
  const factory PermissionError(
      {required final String message,
      final String? resource}) = _$PermissionErrorImpl;

  @override
  String get message;
  String? get resource;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionErrorImplCopyWith<_$PermissionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$PaymentErrorImplCopyWith(
          _$PaymentErrorImpl value, $Res Function(_$PaymentErrorImpl) then) =
      __$$PaymentErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? code,
      String? paymentIntentId,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$PaymentErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$PaymentErrorImpl>
    implements _$$PaymentErrorImplCopyWith<$Res> {
  __$$PaymentErrorImplCopyWithImpl(
      _$PaymentErrorImpl _value, $Res Function(_$PaymentErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? paymentIntentId = freezed,
    Object? details = freezed,
  }) {
    return _then(_$PaymentErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$PaymentErrorImpl implements PaymentError {
  const _$PaymentErrorImpl(
      {required this.message,
      this.code,
      this.paymentIntentId,
      final Map<String, dynamic>? details})
      : _details = details;

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? paymentIntentId;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppError.payment(message: $message, code: $code, paymentIntentId: $paymentIntentId, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, paymentIntentId,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentErrorImplCopyWith<_$PaymentErrorImpl> get copyWith =>
      __$$PaymentErrorImplCopyWithImpl<_$PaymentErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return payment(message, code, paymentIntentId, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return payment?.call(message, code, paymentIntentId, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (payment != null) {
      return payment(message, code, paymentIntentId, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return payment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return payment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (payment != null) {
      return payment(this);
    }
    return orElse();
  }
}

abstract class PaymentError implements AppError {
  const factory PaymentError(
      {required final String message,
      final String? code,
      final String? paymentIntentId,
      final Map<String, dynamic>? details}) = _$PaymentErrorImpl;

  @override
  String get message;
  String? get code;
  String? get paymentIntentId;
  Map<String, dynamic>? get details;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentErrorImplCopyWith<_$PaymentErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Exception? exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$UnknownErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl implements UnknownError {
  const _$UnknownErrorImpl(
      {required this.message, this.exception, this.stackTrace});

  @override
  final String message;
  @override
  final Exception? exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AppError.unknown(message: $message, exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, exception, stackTrace);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)
        $default, {
    required TResult Function(
            String message, String? code, Exception? exception)
        network,
    required TResult Function(
            String message, String? field, Map<String, dynamic>? details)
        validation,
    required TResult Function(String message, String? code) authentication,
    required TResult Function(String message, String? resource) permission,
    required TResult Function(String message, String? code,
            String? paymentIntentId, Map<String, dynamic>? details)
        payment,
    required TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)
        unknown,
  }) {
    return unknown(message, exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult? Function(String message, String? code, Exception? exception)?
        network,
    TResult? Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult? Function(String message, String? code)? authentication,
    TResult? Function(String message, String? resource)? permission,
    TResult? Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult? Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
  }) {
    return unknown?.call(message, exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, String? code, Exception? exception,
            StackTrace? stackTrace, Map<String, dynamic>? details)?
        $default, {
    TResult Function(String message, String? code, Exception? exception)?
        network,
    TResult Function(
            String message, String? field, Map<String, dynamic>? details)?
        validation,
    TResult Function(String message, String? code)? authentication,
    TResult Function(String message, String? resource)? permission,
    TResult Function(String message, String? code, String? paymentIntentId,
            Map<String, dynamic>? details)?
        payment,
    TResult Function(
            String message, Exception? exception, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(ValidationError value) validation,
    required TResult Function(AuthenticationError value) authentication,
    required TResult Function(PermissionError value) permission,
    required TResult Function(PaymentError value) payment,
    required TResult Function(UnknownError value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(AuthenticationError value)? authentication,
    TResult? Function(PermissionError value)? permission,
    TResult? Function(PaymentError value)? payment,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(ValidationError value)? validation,
    TResult Function(AuthenticationError value)? authentication,
    TResult Function(PermissionError value)? permission,
    TResult Function(PaymentError value)? payment,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppError {
  const factory UnknownError(
      {required final String message,
      final Exception? exception,
      final StackTrace? stackTrace}) = _$UnknownErrorImpl;

  @override
  String get message;
  Exception? get exception;
  StackTrace? get stackTrace;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
