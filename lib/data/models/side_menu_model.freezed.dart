// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SideMenuModel {
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get routeName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SideMenuModelCopyWith<SideMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideMenuModelCopyWith<$Res> {
  factory $SideMenuModelCopyWith(
          SideMenuModel value, $Res Function(SideMenuModel) then) =
      _$SideMenuModelCopyWithImpl<$Res, SideMenuModel>;
  @useResult
  $Res call({String name, IconData icon, String routeName});
}

/// @nodoc
class _$SideMenuModelCopyWithImpl<$Res, $Val extends SideMenuModel>
    implements $SideMenuModelCopyWith<$Res> {
  _$SideMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? routeName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SideMenuModelCopyWith<$Res>
    implements $SideMenuModelCopyWith<$Res> {
  factory _$$_SideMenuModelCopyWith(
          _$_SideMenuModel value, $Res Function(_$_SideMenuModel) then) =
      __$$_SideMenuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, IconData icon, String routeName});
}

/// @nodoc
class __$$_SideMenuModelCopyWithImpl<$Res>
    extends _$SideMenuModelCopyWithImpl<$Res, _$_SideMenuModel>
    implements _$$_SideMenuModelCopyWith<$Res> {
  __$$_SideMenuModelCopyWithImpl(
      _$_SideMenuModel _value, $Res Function(_$_SideMenuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? routeName = null,
  }) {
    return _then(_$_SideMenuModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SideMenuModel extends _SideMenuModel {
  const _$_SideMenuModel(
      {required this.name, required this.icon, required this.routeName})
      : super._();

  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String routeName;

  @override
  String toString() {
    return 'SideMenuModel(name: $name, icon: $icon, routeName: $routeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SideMenuModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, icon, routeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SideMenuModelCopyWith<_$_SideMenuModel> get copyWith =>
      __$$_SideMenuModelCopyWithImpl<_$_SideMenuModel>(this, _$identity);
}

abstract class _SideMenuModel extends SideMenuModel {
  const factory _SideMenuModel(
      {required final String name,
      required final IconData icon,
      required final String routeName}) = _$_SideMenuModel;
  const _SideMenuModel._() : super._();

  @override
  String get name;
  @override
  IconData get icon;
  @override
  String get routeName;
  @override
  @JsonKey(ignore: true)
  _$$_SideMenuModelCopyWith<_$_SideMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}
