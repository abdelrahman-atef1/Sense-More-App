import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/app_router.dart';
import 'package:sense_more/business_logic/cubit/bloc_observer.dart';
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
    getIt<BluetoothHelper>().dummyScan();
    return ScreenUtilInit(
      builder: (context, child) {
      return MaterialApp(
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          locale: const Locale('en'),
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('ar', 'EG'), // Arabic
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