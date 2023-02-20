import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/business_logic/cubit/log_cubit/log_cubit.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:sense_more/core/shared/string_manager.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogCubit, LogState>(
        bloc: LogCubit()..bluetoothHelper.scan(context),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Navigator.of(context).popAndPushNamed(StringManager.loginRoute);
                    },
                    child: const Text('تسجيل الخروج'))
              ],
            ),
            body: const BluetoothScreen(),
            floatingActionButton: StreamBuilder<bool>(
              stream: FlutterBlue.instance.isScanning,
              initialData: false,
              builder: (c, snapshot) {
                if (snapshot.data == true) {
                  return FloatingActionButton(
                    onPressed: () => FlutterBlue.instance.stopScan(),
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.stop),
                  );
                } else {
                  return FloatingActionButton(
                    child: const Icon(Icons.search),
                    onPressed: () => FlutterBlue.instance
                        .startScan(timeout: const Duration(seconds: 2)),
                  );
                }
              },
            ),
          );
        });
  }
}

class BluetoothScreen extends StatelessWidget {
  const BluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          FlutterBlue.instance.startScan(timeout: const Duration(seconds: 2)),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<BluetoothDevice>>(
              future: FlutterBlue.instance.connectedDevices,
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data
                        ?.map(
                          (device) => ListTile(
                            title: Text(device.name),
                            subtitle: Text(device.id.toString()),
                            trailing: StreamBuilder<BluetoothDeviceState>(
                              stream: device.state,
                              initialData: BluetoothDeviceState.disconnected,
                              builder: (c, snapshot) => Text(snapshot.data
                                  .toString()
                                  .split('.')[1]
                                  .toUpperCase()),
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data
                        ?.map(
                          (result) => ListTile(
                            title: Text(result.device.name),
                            subtitle: Text(result.device.id.toString()),
                            trailing: Text(result.rssi.toString()),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
