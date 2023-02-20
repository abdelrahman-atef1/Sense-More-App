// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncmentModel _$AnnouncmentModelFromJson(Map<String, dynamic> json) {
  return _AnnouncmentModel.fromJson(json);
}

/// @nodoc
mixin _$AnnouncmentModel {
  String get date => throw _privateConstructorUsedError;
  String get announcment => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncmentModelCopyWith<AnnouncmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncmentModelCopyWith<$Res> {
  factory $AnnouncmentModelCopyWith(
          AnnouncmentModel value, $Res Function(AnnouncmentModel) then) =
      _$AnnouncmentModelCopyWithImpl<$Res, AnnouncmentModel>;
  @useResult
  $Res call({String date, String announcment, String uid, UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AnnouncmentModelCopyWithImpl<$Res, $Val extends AnnouncmentModel>
    implements $AnnouncmentModelCopyWith<$Res> {
  _$AnnouncmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? announcment = null,
    Object? uid = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      announcment: null == announcment
          ? _value.announcment
          : announcment // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnnouncmentModelCopyWith<$Res>
    implements $AnnouncmentModelCopyWith<$Res> {
  factory _$$_AnnouncmentModelCopyWith(
          _$_AnnouncmentModel value, $Res Function(_$_AnnouncmentModel) then) =
      __$$_AnnouncmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String announcment, String uid, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_AnnouncmentModelCopyWithImpl<$Res>
    extends _$AnnouncmentModelCopyWithImpl<$Res, _$_AnnouncmentModel>
    implements _$$_AnnouncmentModelCopyWith<$Res> {
  __$$_AnnouncmentModelCopyWithImpl(
      _$_AnnouncmentModel _value, $Res Function(_$_AnnouncmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? announcment = null,
    Object? uid = null,
    Object? user = freezed,
  }) {
    return _then(_$_AnnouncmentModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      announcment: null == announcment
          ? _value.announcment
          : announcment // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncmentModel extends _AnnouncmentModel {
  const _$_AnnouncmentModel(
      {required this.date,
      required this.announcment,
      required this.uid,
      this.user})
      : super._();

  factory _$_AnnouncmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncmentModelFromJson(json);

  @override
  final String date;
  @override
  final String announcment;
  @override
  final String uid;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AnnouncmentModel(date: $date, announcment: $announcment, uid: $uid, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncmentModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.announcment, announcment) ||
                other.announcment == announcment) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, announcment, uid, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncmentModelCopyWith<_$_AnnouncmentModel> get copyWith =>
      __$$_AnnouncmentModelCopyWithImpl<_$_AnnouncmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncmentModelToJson(
      this,
    );
  }
}

abstract class _AnnouncmentModel extends AnnouncmentModel {
  const factory _AnnouncmentModel(
      {required final String date,
      required final String announcment,
      required final String uid,
      final UserModel? user}) = _$_AnnouncmentModel;
  const _AnnouncmentModel._() : super._();

  factory _AnnouncmentModel.fromJson(Map<String, dynamic> json) =
      _$_AnnouncmentModel.fromJson;

  @override
  String get date;
  @override
  String get announcment;
  @override
  String get uid;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncmentModelCopyWith<_$_AnnouncmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
