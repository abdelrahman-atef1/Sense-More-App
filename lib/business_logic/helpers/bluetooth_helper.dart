import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:system_settings/system_settings.dart';
class BluetoothHelper {
  late FlutterBluePlus flutterBlue;
  BluetoothHelper(){
    initialize();
  }
  
  FlutterBluePlus initialize() {
    flutterBlue = FlutterBluePlus.instance;
    return flutterBlue;
  }
  scan(BuildContext context) async{
    flutterBlue.setLogLevel(LogLevel.debug);
    flutterBlue.isOn.asStream().listen((isOn) async{ 
      if(isOn == false){
        await _showMyDialog(context);
      }
    });
    // Start scanning
    flutterBlue.startScan(timeout: const Duration(seconds: 10));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
        // do something with scan results
          debugPrint('subscription callback------------');
        for (ScanResult r in results) {
            debugPrint('${r.device.name} found! rssi: ${r.rssi}');
        }
    });
    // Stop scanning
    await flutterBlue.stopScan();
    flutterBlue.isScanning.listen((isScanning) {
        if(isScanning){
          debugPrint('scanning');
        }else{
          debugPrint('not scanning');
          flutterBlue.startScan(timeout: const Duration(seconds: 10));
        }
      });
  }
   

  connect()async{
    flutterBlue.setLogLevel(LogLevel.alert);
    if(await flutterBlue.isOn){
    }
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
