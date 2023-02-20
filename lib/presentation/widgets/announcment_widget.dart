import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/data/models/announcement_model.dart';

class AnnouncmentItem extends StatelessWidget {
  final AnnouncmentModel announcmentModel;
  const AnnouncmentItem({
    super.key,
    required this.announcmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.primaryLight,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Column(
        children: [
          Text(announcmentModel.announcment,style: getLightStyle(color: Colors.white),),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                width: 30.r,
                height: 30.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: announcmentModel.user?.profileImage ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => SvgPicture.asset(SVGAssets.userCircle,width: 30.r),
                    ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(announcmentModel.user?.fullName??'',style: getLightStyle(color: ColorManager.white),),
              const Spacer(),
              Text(announcmentModel.date,style: getLightStyle(color: ColorManager.white),),
            ],
          )
        ],
      ),
    );
  }
}

