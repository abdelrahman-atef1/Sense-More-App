import 'package:flutter/material.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double width;
  final double height;
  final void Function()? onPressed;

  const GradientButton({
    Key? key,
    required this.child,
    this.gradient = ColorManager.defaultGradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(gradient: gradient,
        borderRadius: BorderRadius.circular(AppSize.s8),
       boxShadow: const [
        // BoxShadow(
        //   color: Colors.grey[500],
        //   offset: const Offset(0.0, 1.5),
        //   blurRadius: 1.5,
        // ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}