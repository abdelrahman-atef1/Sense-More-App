import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
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
            ListView(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MessageItem(
                  name: 'Human Resources',
                  message: 'When will the meeting start?',
                ),
                Divider(),
                MessageItem(name: 'Flutter Developer',
                message: 'I have completed all assigned tasks.',
                ),
                Divider(),
                // MessageItem(name: ''),
                // Divider(),
              ],
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String name;
  final String message;
  const MessageItem({
    required this.name,
    required this.message,
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
            child: Text(name.split('').first.toUpperCase(),style: getBlackStyle(color: ColorManager.white,fontSize: FontSize.s22.sp),),
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
                        '@$name',
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
                        message,
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