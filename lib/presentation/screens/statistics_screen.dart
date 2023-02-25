import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopSectionHome(user: getIt<LoginCubit>().loggedInUser),
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: ColorManager.defaultGrey,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'You have vacations',
                        style: getRegularStyle(
                            color: ColorManager.greyDark,
                            fontSize: FontSize.s16.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('12',style: getBlackStyle(color: ColorManager.primary),),
                              Text('Days Left',style: getBoldStyle(color: ColorManager.greyDark),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('18',style: getBlackStyle(color: ColorManager.error),),
                              Text('Consumed',style: getBoldStyle(color: ColorManager.greyDark),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.r),
                  height: 75.r,
                  width: 75.r,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: const CircularProgressIndicator(
                          value: 0.8,
                          backgroundColor: ColorManager.white,
                          strokeWidth: 12,
                        ),
                      ),
                      Text('80%',style: getBlackStyle(color: ColorManager.primary),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}