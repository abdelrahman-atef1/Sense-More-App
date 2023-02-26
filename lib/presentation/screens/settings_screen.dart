import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/business_logic/cubit/settings_cubit/settings_cubit.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/top_section.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final SettingsCubit cubit = getIt<SettingsCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
          return Column(
            children: [
              TopSection(
                  child: Center(
                child: Text(
                  'Settings',
                  style: getBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s20.sp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: GestureDetector(
                        onTap: ()=> Navigator.pop(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                              const Icon(Icons.arrow_back,color: ColorManager.black),
                              const SizedBox(width: 5),
                              Text('back',style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s18),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //Radio
                    GestureDetector(
                      onTap: () => cubit.changeLanguage(''),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<String>(
                                  value: '',
                                  groupValue: cubit.local,
                                  onChanged: (checked) => cubit.changeLanguage('')),
                          const Icon(CupertinoIcons.settings),
                              Text(
                                'Device Settings',
                                style: TextStyle(
                                    color: cubit.local == ''
                                        ? ColorManager.primary
                                        : ColorManager.disabled),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => cubit.changeLanguage('ar'),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                      value: 'ar',
                                      groupValue: cubit.local,
                                      onChanged: (checked) =>
                                          cubit.changeLanguage('ar')),
                                  Text(
                                    'Arabic',
                                    style: TextStyle(
                                        color: cubit.local == 'ar'
                                            ? ColorManager.primary
                                            : ColorManager.disabled),
                                  ),
                                ],
                              ),
                              Image.asset(Assets.eg,width: 75.r,height:50.r,fit: BoxFit.cover,)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => cubit.changeLanguage('en'),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                      value: 'en',
                                      groupValue: cubit.local,
                                      onChanged: (checked) =>
                                          cubit.changeLanguage('en')),
                                  Text(
                                    'English',
                                    style: TextStyle(
                                        color: cubit.local == 'en'
                                            ? ColorManager.primary
                                            : ColorManager.disabled),
                                  ),
                                ],
                              ),
                              Image.asset(Assets.us,width: 75.r,height:50.r,fit: BoxFit.cover,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
