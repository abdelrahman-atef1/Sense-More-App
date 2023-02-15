
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/core/shared/bluetooth_helper.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit() : super(LogInitial());
    BluetoothHelper bluetoothHelper = BluetoothHelper();
}
