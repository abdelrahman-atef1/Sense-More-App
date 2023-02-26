import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/data/models/scan_result_model.dart';
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
  ScanResultModel? dummyNearestDevice;
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
      timeout: const Duration(seconds: 15));
    // Listen to scan results
    flutterBlue.scanResults.listen((results) => populateScanResults(results));
    flutterBlue.isScanning.listen((isScanning) async {
      if (isScanning) {
        debugPrint('scanning');
      } else {
        debugPrint('not scanning');
        // await flutterBlue.stopScan();
        flutterBlue.scan(timeout: const Duration(seconds: 15)).listen((results) {
              populateScanResults([results]);
        });
          // do something with scan results
          debugPrint('isnotScanning callback------------');
      }
    });
  }

  dummyScan(){
    Timer.periodic(const Duration(seconds: 10), (timer) {
      final _random = Random();
      var randomElement = dummyScanResults[_random.nextInt(dummyScanResults.length)];
      dummyNearestDevice = randomElement;
      getIt<HomeCubit>().emit(HomeState.bluetoothDummySearch(dummyNearestDevice!));
    });
  }

  List<ScanResultModel> dummyScanResults = [
    ScanResultModel(name: 'Main Hall',rssi: -10),
    ScanResultModel(name: 'Main Hall',rssi: -30),
    ScanResultModel(name: 'Main Hall',rssi: -50),
    ScanResultModel(name: 'HR Department',rssi: -10),
    ScanResultModel(name: 'HR Department',rssi: -23),
    ScanResultModel(name: 'HR Department',rssi: -30),
    ScanResultModel(name: 'HR Department',rssi: -49),
    ScanResultModel(name: 'HR Department',rssi: -60),
    ScanResultModel(name: 'Manager Office',rssi: -80),
    ScanResultModel(name: 'Manager Office',rssi: -63),
    ScanResultModel(name: 'Manager Office',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -10),
    ScanResultModel(name: 'Cafeteria',rssi: -20),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Cafeteria',rssi: -60),
    ScanResultModel(name: 'Out Range',rssi: -80),
    ScanResultModel(name: 'IT Department',rssi: -80),
    ScanResultModel(name: 'Marketing Department',rssi: -80),
    ScanResultModel(name: 'Finance Department',rssi: -80),
    ScanResultModel(name: 'Sales Department',rssi: -80),
    ScanResultModel(name: 'General Management',rssi: -80),
    ScanResultModel(name: 'Main Hall',rssi: -80),
    ScanResultModel(name: 'Main Hall',rssi: -80),
    ScanResultModel(name: 'Main Hall',rssi: -80),
  ];
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
        flutterBlue.scan(timeout: const Duration(seconds: 15));
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
