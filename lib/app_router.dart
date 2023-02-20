import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/presentation/screens/forgot_password_page.dart';
import 'package:sense_more/presentation/screens/home_screen.dart';
import 'package:sense_more/presentation/screens/log_screen.dart';
import 'package:sense_more/presentation/screens/login_screen.dart';
import 'package:sense_more/presentation/screens/profile_screen.dart';
import 'package:sense_more/presentation/screens/register_screen.dart';
import 'package:sense_more/presentation/screens/settings_screen.dart';
import 'package:sense_more/presentation/screens/start_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    FocusManager.instance.primaryFocus?.unfocus();
    debugPrint('Navigated to ===> ${settings.name}');
    switch (settings.name) {
      case StringManager.startRoute:
        return MaterialPageRoute(builder: (_) => const StartPage());
      case StringManager.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case StringManager.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case StringManager.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case StringManager.homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: getIt<HomeCubit>()..reloadUser()..getAnnouncments(),
                child: const HomeScreen()));
      case StringManager.logRoute:
        return MaterialPageRoute(builder: (_) => const LogScreen());
      case StringManager.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case StringManager.profileRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt<ProfileCubit>()..setUserData(),
                  child: const ProfileScreen(),
                ));
      default:
        MaterialPageRoute(builder: (_) => const Text('can\'t find route'));
    }
    return MaterialPageRoute(builder: (_) => const Text('can\'t find route'));
  }
}
