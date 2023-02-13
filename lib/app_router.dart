import 'package:flutter/material.dart';
import 'package:sense_more/presentation/screens/log_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> const LogScreen());
      default: MaterialPageRoute(builder: (_)=> const Text('can\'t find route'));
    }
    return MaterialPageRoute(builder: (_)=> const Text('can\'t find route'));
  }
}