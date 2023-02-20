import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sense_more/app_router.dart';
import 'package:sense_more/business_logic/cubit/bloc_observer.dart';
import 'package:sense_more/business_logic/cubit/log_cubit/log_cubit.dart';
import 'package:sense_more/core/app_localization/app_localization.dart';
import 'package:sense_more/core/shared/Utilities/no_thump.dart';
import 'package:sense_more/core/shared/bluetooth_helper.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/theme_manager.dart';
import 'package:sense_more/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(SenseMoreApp(appRouter: AppRouter()));
}

class SenseMoreApp extends StatelessWidget {
  final AppRouter appRouter;
  const SenseMoreApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getIt<BluetoothHelper>().scan(context);
    return ScreenUtilInit(
      builder: (context, child) {
      return MaterialApp(
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('ar', 'EG'), // Arabic
            Locale('en', 'US'), // English
          ],
          localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: getApplicationTheme(),
        );
        },
    );
  }
}