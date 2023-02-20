part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.pickedImage(File imagePath) = _PickedImage;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.success() = _Success;

  const factory ProfileState.error(Object error) = _Error;
}
