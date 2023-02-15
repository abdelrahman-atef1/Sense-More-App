import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:system_settings/system_settings.dart';
class BluetoothHelper {
  late FlutterBlue flutterBlue;
  BluetoothHelper(){
    initialize();
  }
  
  FlutterBlue initialize() {
    flutterBlue = FlutterBlue.instance;
    return flutterBlue;
  }

  void scanForDevices() async {
    flutterBlue.scan(
      scanMode: ScanMode.opportunistic,
      timeout: const Duration(seconds: 30)).listen((scanResult) async {
      debugPrint('scan subscription callback------------');
      if (scanResult.device.name == "your_device_name") {
        debugPrint('${scanResult.device.name} found! rssi: ${scanResult.rssi}');
        print("found device");
        //Assigning bluetooth device
        //After that we stop the scanning for device
      }
    });
  }
  
  scan(BuildContext context) async{
    initialize();
    // flutterBlue.setLogLevel(LogLevel.debug);
    flutterBlue.isOn.asStream().listen((isOn) async{ 
      if(isOn == false){
        await _showMyDialog(context);
      }
    });
    // Start scanning
    await flutterBlue.scan(
      scanMode: ScanMode.opportunistic,
      timeout: const Duration(seconds: 30));
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
    flutterBlue.isScanning.listen((isScanning) async{
        if(isScanning){
          debugPrint('scanning');
        }else{
          debugPrint('not scanning');
         await flutterBlue.scan(timeout: const Duration(seconds: 10)).listen((results) {
        // do something with scan results
          debugPrint('subscription callback------------');
        // for (ScanResult r in results) {
            debugPrint('${results.device.name} found! rssi: ${results.rssi}');
        // }
    });
          // flutterBlue.startScan(timeout: const Duration(seconds: 10));
        }
      });
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
