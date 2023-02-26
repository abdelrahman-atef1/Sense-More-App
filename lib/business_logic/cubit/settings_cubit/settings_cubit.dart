import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState.initial());

  String local = 'en';
  void changeLanguage(String local){
    this.local = local;
    emit(SettingsState.changeLocal(local));
  }
}
