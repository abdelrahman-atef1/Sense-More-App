import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/presentation/widgets/splash_screen.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  String navigationPage(){
    if(FirebaseAuth.instance.currentUser != null){
      return StringManager.homeRoute;
    }else{
      return StringManager.loginRoute;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        duration: const Duration(milliseconds: 1000),
        navigateAfterDuration: navigationPage(),
        gradientBackground: ColorManager.defaultGradient,
        image: Image.asset(Assets.logoWhite),
        // title:  Text('Sense More',
        //         style: TextStyle(color: Colors.white ,fontSize: 40.sp)),
        backgroundColor: Colors.white,
        photoSize: 200.0,
      ),
    );
  }

}
