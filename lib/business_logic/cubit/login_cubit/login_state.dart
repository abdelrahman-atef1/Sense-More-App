
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/data/models/user_model.dart';

part 'login_state.freezed.dart';
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.changeUserType(bool isManager) = _ChangeUserType;
  const factory LoginState.loadingEmail() = _LoadingEmail;
  const factory LoginState.loadingGoogle() = _LoadingGoogle;
  const factory LoginState.success(UserModel user) = _Success;
  const factory LoginState.error(Object error) = _Error;
}
