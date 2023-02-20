import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:sense_more/core/shared/Utilities/validation.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
      state.whenOrNull(
          success: () => Navigator.of(context)
              .pop(StringManager.homeRoute));
      },
      builder: (context, state){
      ProfileCubit cubit = getIt();
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: SvgPicture.asset(SVGAssets.backButton,width: 35.r)),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('تعديل بياناتك',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s18.sp)),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: (){
                        cubit.pickImage();
                      },
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            width: 60.r,
                            height: 60.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                            child: ClipOval(
                              child: cubit.pickedFile?.path != null?
                              Image.file(cubit.pickedFile!):
                              CachedNetworkImage(
                                imageUrl: cubit.firebaseUser?.photoURL??'',
                                errorWidget: (context, url, error) => SvgPicture.asset(SVGAssets.userCircle,width: 60.r),
                                ),
                            ),
                          ),
                          const Icon(Icons.add_circle,color: ColorManager.white,shadows: [Shadow(
                            color: ColorManager.primary,
                            blurRadius: 5
                          )],)
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
                                  controller: cubit.fullNameController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) => nameValidation(value??''),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    label: const Text('الاسم'),
                                    hintText: 'أدخل اسمك كاملاً',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(SVGAssets.user,width: 15.r),
                                    ),
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
                                  controller: cubit.emailController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) => emailValidation(value??''),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    label: const Text('البريد الإلكتروني'),
                                    hintText: 'أدخل بريدك الإلكتروني',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(SVGAssets.email,width: 15.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 15.h),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: AutoDirectionFormField(
                          //         obscureText: true,
                          //         controller: cubit.passwordController,
                          //         keyboardType: TextInputType.visiblePassword,
                          //         decoration: InputDecoration(
                          //           label: const Text('كلمة المرور'),
                          //           hintText: 'أدخل كلمة المرور',
                          //           prefix: Padding(
                          //             padding: const EdgeInsetsDirectional.only(end:8.0),
                          //             child: SvgPicture.asset(SVGAssets.lock,width: 15.r),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 15.h),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: AutoDirectionFormField(
                          //         obscureText: true,
                          //         controller: passwordConfirmationController,
                          //         autovalidateMode: AutovalidateMode.onUserInteraction,
                          //         validator: (value) => passwordValidation(value??'',passwordController.text),
                          //         keyboardType: TextInputType.visiblePassword,
                          //         decoration: InputDecoration(
                          //           label: const Text('تأكيد كلمة المرور'),
                          //           hintText: 'أدخل كلمة المرور مرة أخرى',
                          //           prefix: Padding(
                          //             padding: const EdgeInsetsDirectional.only(end:8.0),
                          //             child: SvgPicture.asset(SVGAssets.lock,width: 15.r),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        
                        ],
                      )),
                    // SizedBox(height: 5.h),
                    // Row(
                    //   children: [
                    //     InkWell(
                    //       onTap: ()=>Navigator.of(context).pushNamed(StringManager.forgotPasswordRoute),
                    //       child: Text(
                    //         'نسيت كلمة المرور؟',
                    //         style: getLinkStyle(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        state.maybeWhen(
                          loading: ()=> const Expanded(child: Center(child: SpinKitThreeBounce(color: ColorManager.primary,size: 25))),
                          orElse: ()=> Expanded(
                          child: FilledButton(
                            onPressed: ()async {
                              await cubit.updateData();
                            }, 
                            child: Text('حفظ',style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),),
                            ),
                        ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    });
    
  }
}