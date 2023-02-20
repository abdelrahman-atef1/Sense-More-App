import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:system_settings/system_settings.dart';
class BluetoothHelper{
  late FlutterBlue flutterBlue;
  
  FlutterBlue initialize() {
    flutterBlue = FlutterBlue.instance;
    return flutterBlue;
  }

  // void scanForDevices() async {
  //   flutterBlue.scan(
  //     scanMode: ScanMode.opportunistic,
  //     timeout: const Duration(seconds: 30)).listen((scanResult) async {
  //     debugPrint('scan subscription callback------------');
  //     if (scanResult.device.name == "your_device_name") {
  //       debugPrint('${scanResult.device.name} found! rssi: ${scanResult.rssi}');
  //       debugPrint("found device");
  //       //Assigning bluetooth device
  //       //After that we stop the scanning for device
  //     }
  //   });
  // }
  List<ScanResult> scanResults = [];
  ScanResult? nearestDevice;
  scan(BuildContext context) async{
    initialize();
    // flutterBlue.setLogLevel(LogLevel.debug);
    flutterBlue.isOn.asStream().listen((isOn) async{ 
      if(isOn == false){
        await _showMyDialog(context);
      }
    });
    // Start scanning
    flutterBlue.scan(
      scanMode: ScanMode.opportunistic,
      timeout: const Duration(seconds: 10));
    // Listen to scan results
    flutterBlue.scanResults.listen((results) => populateScanResults(results));
    flutterBlue.isScanning.listen((isScanning) async {
      if (isScanning) {
        debugPrint('scanning');
      } else {
        debugPrint('not scanning');
        // await flutterBlue.stopScan();
        flutterBlue.scan(timeout: const Duration(seconds: 10)).listen((results) {
              populateScanResults([results]);
        });
          // do something with scan results
          debugPrint('isnotScanning callback------------');
      }
    });
  }

  void populateScanResults(List<ScanResult> results){
        // do something with scan results
          debugPrint('scanResults callback------------');
          scanResults = results;
          List<int> rssis = scanResults.map((e) => e.rssi).toList();
          rssis.sort();
          if(rssis.isEmpty) {
            nearestDevice = null;
          } else {
            nearestDevice = scanResults.firstWhere((e) => e.rssi == rssis.last);
          }
        // for (ScanResult r in results) {
        //   debugPrint('${r.device.name} found! rssi: ${r.rssi}');
        // }
        if(nearestDevice != null){
          debugPrint('${nearestDevice?.device.name} found! rssi: ${nearestDevice?.rssi}');
          getIt<HomeCubit>().emit(HomeState.bluetoothSearch(nearestDevice!));
        }
        flutterBlue.scan(timeout: const Duration(seconds: 10));
  }
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please enable bluetooth for the app to function normally'),
          actions: <Widget>[
            TextButton(
              child: const Text('Enable'),
              onPressed: () async{
                Navigator.of(context).pop();
                await SystemSettings.bluetooth();
              },
            ),
            TextButton(
              child: const Text('Close App'),
              onPressed: () {
                exit(1);
              },
            ),
          ],
        );
      },
    );
  }

}
