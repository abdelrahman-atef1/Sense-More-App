// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ChangeUserTypeCopyWith<$Res> {
  factory _$$_ChangeUserTypeCopyWith(
          _$_ChangeUserType value, $Res Function(_$_ChangeUserType) then) =
      __$$_ChangeUserTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isManager});
}

/// @nodoc
class __$$_ChangeUserTypeCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_ChangeUserType>
    implements _$$_ChangeUserTypeCopyWith<$Res> {
  __$$_ChangeUserTypeCopyWithImpl(
      _$_ChangeUserType _value, $Res Function(_$_ChangeUserType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isManager = null,
  }) {
    return _then(_$_ChangeUserType(
      null == isManager
          ? _value.isManager
          : isManager // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChangeUserType implements _ChangeUserType {
  const _$_ChangeUserType(this.isManager);

  @override
  final bool isManager;

  @override
  String toString() {
    return 'LoginState.changeUserType(isManager: $isManager)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeUserType &&
            (identical(other.isManager, isManager) ||
                other.isManager == isManager));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeUserTypeCopyWith<_$_ChangeUserType> get copyWith =>
      __$$_ChangeUserTypeCopyWithImpl<_$_ChangeUserType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return changeUserType(isManager);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return changeUserType?.call(isManager);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (changeUserType != null) {
      return changeUserType(isManager);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return changeUserType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return changeUserType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (changeUserType != null) {
      return changeUserType(this);
    }
    return orElse();
  }
}

abstract class _ChangeUserType implements LoginState {
  const factory _ChangeUserType(final bool isManager) = _$_ChangeUserType;

  bool get isManager;
  @JsonKey(ignore: true)
  _$$_ChangeUserTypeCopyWith<_$_ChangeUserType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingEmailCopyWith<$Res> {
  factory _$$_LoadingEmailCopyWith(
          _$_LoadingEmail value, $Res Function(_$_LoadingEmail) then) =
      __$$_LoadingEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingEmailCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoadingEmail>
    implements _$$_LoadingEmailCopyWith<$Res> {
  __$$_LoadingEmailCopyWithImpl(
      _$_LoadingEmail _value, $Res Function(_$_LoadingEmail) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingEmail implements _LoadingEmail {
  const _$_LoadingEmail();

  @override
  String toString() {
    return 'LoginState.loadingEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return loadingEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return loadingEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (loadingEmail != null) {
      return loadingEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loadingEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loadingEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadingEmail != null) {
      return loadingEmail(this);
    }
    return orElse();
  }
}

abstract class _LoadingEmail implements LoginState {
  const factory _LoadingEmail() = _$_LoadingEmail;
}

/// @nodoc
abstract class _$$_LoadingGoogleCopyWith<$Res> {
  factory _$$_LoadingGoogleCopyWith(
          _$_LoadingGoogle value, $Res Function(_$_LoadingGoogle) then) =
      __$$_LoadingGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingGoogleCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoadingGoogle>
    implements _$$_LoadingGoogleCopyWith<$Res> {
  __$$_LoadingGoogleCopyWithImpl(
      _$_LoadingGoogle _value, $Res Function(_$_LoadingGoogle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingGoogle implements _LoadingGoogle {
  const _$_LoadingGoogle();

  @override
  String toString() {
    return 'LoginState.loadingGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return loadingGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return loadingGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (loadingGoogle != null) {
      return loadingGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loadingGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loadingGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadingGoogle != null) {
      return loadingGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoadingGoogle implements LoginState {
  const factory _LoadingGoogle() = _$_LoadingGoogle;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Success(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'LoginState.success(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements LoginState {
  const factory _Success(final UserModel user) = _$_Success;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'LoginState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isManager) changeUserType,
    required TResult Function() loadingEmail,
    required TResult Function() loadingGoogle,
    required TResult Function(UserModel user) success,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isManager)? changeUserType,
    TResult? Function()? loadingEmail,
    TResult? Function()? loadingGoogle,
    TResult? Function(UserModel user)? success,
    TResult? Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isManager)? changeUserType,
    TResult Function()? loadingEmail,
    TResult Function()? loadingGoogle,
    TResult Function(UserModel user)? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeUserType value) changeUserType,
    required TResult Function(_LoadingEmail value) loadingEmail,
    required TResult Function(_LoadingGoogle value) loadingGoogle,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeUserType value)? changeUserType,
    TResult? Function(_LoadingEmail value)? loadingEmail,
    TResult? Function(_LoadingGoogle value)? loadingGoogle,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeUserType value)? changeUserType,
    TResult Function(_LoadingEmail value)? loadingEmail,
    TResult Function(_LoadingGoogle value)? loadingGoogle,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LoginState {
  const factory _Error(final Object error) = _$_Error;

  Object get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
