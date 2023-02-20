import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';

class UserDataWidget extends StatelessWidget {
  final Color color;
  final String? roomNumber;
  final String? rssi;
  const UserDataWidget({
    super.key,
    required this.user,
    this.roomNumber,
    this.rssi,
    this.color = ColorManager.white
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.photoURL ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => SvgPicture.asset(SVGAssets.userCircle,width: 60.r),
              ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(user.displayName??'',style: getRegularStyle(color: color),),
        Text(user.email??'',style: getRegularStyle(color: color)),
        roomNumber == null? const SizedBox():
        Text('Room Number: $roomNumber',style: getRegularStyle(color: color)),
        rssi == null? const SizedBox():
        Text('Rssi: $rssi',style: getRegularStyle(color: color)),
        SizedBox(height: 10.h),
      ],
    );
  }
}
