import 'package:flutter/material.dart';
import '../app_router.dart';


void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
