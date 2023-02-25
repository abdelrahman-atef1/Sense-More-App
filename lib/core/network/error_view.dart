import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final bool isBackgroundWhite;

  const ErrorView(
    this.errorMessage,
    this.onRetry, {
    this.isBackgroundWhite = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning,
          color: Color(0xffFFA5A8),
          size: 64,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          errorMessage,
          style: TextStyle(
              //fontFamily: Fonts.appFontFamily,
              fontSize: 24.sp,
              color: isBackgroundWhite ? const Color(0xff172A65) : Colors.white,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8.h,
        ),
        //ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff10CFC9), Color(0xff0094D3)],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 25,
          child: ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //shadowColor: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0.1),
            ),
            child: Text(
              'retry',
              style: TextStyle(
                fontSize: 18.sp,
                //fontFamily: Fonts.appFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
