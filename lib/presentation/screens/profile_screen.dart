import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/core/shared/Utilities/validation.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
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
                      InkWell(
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              width: 60.r,
                              height: 60.r,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: ClipOval(
                                child: cubit.pickedFile?.path != null
                                    ? Image.file(cubit.pickedFile!)
                                    : CachedNetworkImage(
                                        imageUrl:
                                            cubit.firebaseUser?.photoURL ?? '',
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(SVGAssets.userCircle,
                                                width: 60.r),
                                      ),
                              ),
                            ),
                            const Icon(
                              Icons.add_circle,
                              color: ColorManager.white,
                              shadows: [
                                Shadow(color: ColorManager.primary, blurRadius: 5)
                              ],
                            )
                          ],
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
                                    label: Text('الاسم'),
                                    hintText: 'أدخل اسمك كاملاً',
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
                                    label:  Text('البريد الإلكتروني'),
                                    hintText: 'أدخل بريدك الإلكتروني',
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
                      Visibility(
                        visible: kDebugMode,
                        child: Row(
                          children: [
                            state.maybeWhen(
                              loading: () => const Expanded(
                                  child: Center(
                                      child: SpinKitThreeBounce(
                                          color: ColorManager.primary, size: 25))),
                              orElse: () => Expanded(
                                child: FilledButton(
                                  onPressed: () async {
                                    await cubit.updateData();
                                  },
                                  child: Text(
                                    'حفظ',
                                    style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
