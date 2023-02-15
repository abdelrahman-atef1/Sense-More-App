import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/log_cubit/log_cubit.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogCubit,LogState>(
      bloc: LogCubit()..bluetoothHelper.scan(context),
      builder: (context,state) {
        return const Scaffold(
          body: Center(child: Text('hi')));
      }
    );
  }
}