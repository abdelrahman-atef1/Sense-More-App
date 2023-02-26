import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/core/shared/Utilities/validation.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_)=> getIt<ProfileCubit>()..setUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        state.whenOrNull(
            success: () => Navigator.of(context).pop(StringManager.homeRoute));
      }, builder: (context, state) {
        ProfileCubit cubit = getIt();
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopSectionHome(user: getIt<LoginCubit>().loggedInUser),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
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
                      Form(
                        child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AutoDirectionFormField(
                                  enabled: false,
                                  controller: cubit.fullNameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      nameValidation(value ?? ''),
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    label: Text('Name'),
                                    hintText:'Your Full Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: AutoDirectionFormField(
                                  enabled: !kDebugMode,
                                  controller: cubit.emailController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      emailValidation(value ?? ''),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:const InputDecoration(
                                    label:  Text('Email'),
                                    hintText: 'Your Email',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: AutoDirectionFormField(
                                  enabled: false,
                                  controller: cubit.jopTitleController,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    label: Text('Jop Title'),
                                    hintText: 'Your Jop Title',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
