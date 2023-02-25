import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';

class TopSection extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool showIcon;
  const TopSection({
    Key? key,
    required this.child,
    this.height,
    this.padding,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: height,
          width: double.infinity,
          padding: padding?? EdgeInsets.all(30.r),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              gradient: ColorManager.defaultGradient,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.r),
                ),
              boxShadow: [ColorManager.defaultShadow]),
          child: child
        ),
        Visibility(
          visible: showIcon,
          child: Positioned(
            right: -50,
            bottom: -100,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                Assets.logoIconWhite,
                width: 300.r,
              ),
            ),
          ),
        )
      ],
    );
  }
}
