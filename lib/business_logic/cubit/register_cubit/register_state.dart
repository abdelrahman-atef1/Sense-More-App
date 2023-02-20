import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';
@freezed
class  RegisterState with _$RegisterState {
  const factory  RegisterState.initial() = _Initial;

  const factory  RegisterState.pickedImage(File imagePath) = _PickedImage;

  const factory  RegisterState.loadingGoogle() = _LoadingGoogle;

  const factory  RegisterState.loadingEmail() = _LoadingEmail;

  const factory  RegisterState.success() = _Success;

  const factory  RegisterState.error(Object error) = _Error;
}
