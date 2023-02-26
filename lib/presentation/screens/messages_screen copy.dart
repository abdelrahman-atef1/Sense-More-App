import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';
import 'package:sense_more/presentation/widgets/top_section.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(
              height: 120.h,
              child: Center(
                child: Text(
                  'Your Messages',
                  style: getBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s20.sp),
                ),
              ),
            ),
            ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (_, i) => const MessageItem(),
              separatorBuilder: (_, i) => const Divider(),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0.w,vertical: 5.h),
      child: Row(
        children: [
          Container(
            width: 50.r,
            height: 50.r,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorManager.primaryLight,ColorManager.primary]),
            ),
            child: Text('H'.toUpperCase(),style: getBlackStyle(color: ColorManager.white,fontSize: FontSize.s22.sp),),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '@HRAbdelrahman',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(color: ColorManager.black),
                      ),
                    ),
                    Text(
                        '4:47 PM',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(color: ColorManager.greyTextOpacity),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have done a great jop this month, and you have been',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(color: ColorManager.greyTextOpacity),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}