library splashscreen;

import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final dynamic navigateAfterDuration;
  final double? photoSize;
  final dynamic onClick;
  final Color? loaderColor;
  final Image? image;
  final Text loadingText;
  final ImageProvider imageBackground;
  final Gradient? gradientBackground;

  const SplashScreen(
      {this.loaderColor,
      required this.duration,
      this.photoSize,
      this.onClick,
      this.navigateAfterDuration,
      this.title = const Text(''),
      this.backgroundColor = Colors.white,
      this.styleTextUnderTheLoader = const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      this.image,
      this.loadingText = const Text(""),
      required this.imageBackground,
      this.gradientBackground,
      Key? key})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(widget.duration, () {
      if (widget.navigateAfterDuration is String) {
        // It's fairly safe to assume this is using the in-built material
        // named route component
        Navigator.of(context)
          .pushNamedAndRemoveUntil('${widget.navigateAfterDuration}', (Route<dynamic> route) => false);
        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     widget.navigateAfterSeconds, (Route<dynamic> route) => false);
      } else if (widget.navigateAfterDuration is Widget) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => widget.navigateAfterDuration));
      } else {
        throw ArgumentError(
            'widget.navigateAfterSeconds must either be a String or Widget');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onClick,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageBackground,
                      ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Center(
                        child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: widget.photoSize,
                      child: Container(child: widget.image),
                    )),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    widget.title
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
