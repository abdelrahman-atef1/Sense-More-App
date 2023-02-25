import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/presentation/widgets/default_network_image.dart';
import 'package:sense_more/presentation/widgets/top_section.dart';
import 'package:shimmer/shimmer.dart';
class TopSectionHome extends StatelessWidget {
  const TopSectionHome({
    super.key,
    required this.user,
  });

  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.r),
          child: TopSection(
            child: Column(
              children: [
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Welcome Back!',
                      style: getRegularStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s22.sp),
                    )),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 30.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s16),
                boxShadow: const [BoxShadow(color: ColorManager.primaryLight,blurRadius: AppSize.s12)]
              ),
              child: DefaultNetworkImage(
                width: 120.r,
                height: 150.r,
                imageUrl: user?.profileImage ?? '-',
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: user == null
                            ? TextShimmer(margin: EdgeInsets.only(bottom: 20.h))
                            : Text(
                                user?.fullName ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s18.sp),
                              ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: user == null
                            ? const TextShimmer()
                            : Text(
                                user?.jobTitle ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getRegularStyle(
                                    color: ColorManager.greyText,
                                    fontSize: FontSize.s14.sp),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ],
    );
  }
}

class TextShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  const TextShimmer({
    super.key,
    this.height,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width?? 130.0.w,
      height: height?? 15.0.h,
      child: Shimmer.fromColors(
        baseColor: ColorManager.defaultGrey,
        highlightColor: ColorManager.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s4)
          ),
        )
      ),
    );
  }
}
