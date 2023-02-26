import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_state.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';
import 'package:sense_more/presentation/widgets/gradient_button.dart';
import 'package:sense_more/presentation/widgets/top_section.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginCubit cubit = getIt<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                TopSection(
                  height: 0.5.sh,
                  showIcon: false,
                  padding: EdgeInsetsDirectional.fromSTEB(40.w, 20.h, 40.w, 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(Assets.logoWhite, width: 250.w),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome Back',
                                    style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s22.sp,
                                        height: 1.4)),
                                Text('Login',
                                    style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s22.sp,
                                        height: 1.4)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AutoDirectionFormField(
                                    controller: emailController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => cubit.emailValidation(value ?? ''),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email',
                                      prefixIcon:  Icon(Icons.email),
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
                                    controller: passwordController,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your password',
                                      prefixIcon: Icon(Icons.password),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 5.h),
                      // //Radio
                      // BlocBuilder<LoginCubit, LoginState>(
                      //   buildWhen: (previous, current) => current.mapOrNull(changeUserType: (isManager)=>true)??false,
                      //   builder: (context, state) {
                      //     return Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Expanded(
                      //           child: InkWell(
                      //             onTap: ()=> cubit.changeType(false),
                      //             child: Row(
                      //               children: [
                      //                 Radio<bool>(
                      //                     value: false,
                      //                     groupValue: cubit.isManager,
                      //                     onChanged: (checked) => cubit.changeType(false)),
                      //                 Text(
                      //                   'Employee',
                      //                   style: TextStyle(
                      //                       color: cubit.isManager == false
                      //                           ? ColorManager.primary
                      //                           : ColorManager.disabled),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: InkWell(
                      //             onTap: ()=> cubit.changeType(true),
                      //             child: Row(
                      //               children: [
                      //                 Radio<bool>(
                      //                     value: true,
                      //                     groupValue: cubit.isManager,
                      //                     onChanged: (checked) => cubit.changeType(true)),
                      //                 Text(
                      //                   'Manager',
                      //                   style: TextStyle(
                      //                       color: cubit.isManager == true
                      //                           ? ColorManager.primary
                      //                           : ColorManager.disabled),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // ),
                      
                      SizedBox(height: 15.h),
                      //Login BTN
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            current.whenOrNull(
                                loadingEmail: () => true,
                                success: (c) => true,
                                error: (e) => true) ??
                            false,
                        builder: (context, state) {
                          return state.maybeMap(loadingEmail: (e) {
                            return const SpinKitThreeBounce(color: ColorManager.primary, size: 25);
                          }, orElse: () {
                            return Row(
                              children: [
                                Expanded(
                                  child: 
                                  GradientButton(
                                    onPressed: () async {
                                      await cubit.login(emailController.text,
                                          passwordController.text);
                                      if (FirebaseAuth.instance.currentUser !=
                                          null) {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                StringManager.homeRoute);
                                      }
                                    },
                                    child: Text(
                                      'Login',
                                      style: getBoldStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s14),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Visibility(
                        visible: kDebugMode,
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(StringManager.registerRoute),
                          child: Text(
                            'Don\'t have an account? register now.',
                            style: getLinkStyle(fontSize: FontSize.s14),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 5),
                //       width: 100.w,
                //       height: 1,
                //       color: ColorManager.primaryDark,
                //     ),
                //     Text('او',style: getBoldStyle(color: ColorManager.primary.withOpacity(0.6),fontSize: FontSize.s18),),
                //     Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 5),
                //       width: 100.w,
                //       height: 1,
                //       color: ColorManager.primaryDark,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10.h),
                // //Social Login
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     state is LoginLoadingGoogle?  const SpinKitThreeBounce(color: ColorManager.primary,size: 25):
                //     InkWell(
                //       onTap:()async{
                //         await cubit.loginWithGoogle();
                //         if(FirebaseAuth.instance.currentUser != null){
                //           Navigator.of(context).pushReplacementNamed(StringManager.homeRoute);
                //         }
                //       },
                //       child: Container(
                //         width: 55.r,
                //         height: 55.r,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           border: Border.all(color: ColorManager.primaryDark),
                //         ),
                //         child: Center(child: SvgPicture.asset(SVGAssets.google,width: AppSize.s18.r)),
                //       ),
                //     ),
                //     Container(
                //       width: 55.r,
                //       height: 55.r,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(color: ColorManager.primaryDark),
                //       ),
                //       child: Center(child: SvgPicture.asset(SVGAssets.facebook,width: AppSize.s18.r)),
                //     ),
                //     Container(
                //       width: 55.r,
                //       height: 55.r,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(color: ColorManager.primaryDark),
                //       ),
                //       child: Center(child: SvgPicture.asset(SVGAssets.twitter,width: AppSize.s18.r)),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
      );
    });
  }
}
