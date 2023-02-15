import 'package:flutter/material.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/presentation/screens/log_screen.dart';
import 'package:sense_more/presentation/screens/login_screen.dart';
import 'package:sense_more/presentation/screens/register_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings){
    debugPrint('Navigated to ===> ${settings.name}');
    switch (settings.name) {
      case StringManager.loginRoute:
        return MaterialPageRoute(builder: (_)=> LoginScreen());
      case StringManager.logRoute:
        return MaterialPageRoute(builder: (_)=> const LogScreen());
      case StringManager.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterScreen());
      default: MaterialPageRoute(builder: (_)=> const Text('can\'t find route'));
    }
    return MaterialPageRoute(builder: (_)=> const Text('can\'t find route'));
  }
}