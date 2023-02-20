import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => getIt.get<LoginCubit>(),
    child: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state){
        LoginCubit cubit = getIt.get<LoginCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('تسجيل الدخول',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s18.sp)),
                      SizedBox(height: 20.h),
                      SvgPicture.asset(SVGAssets.userCircle,width: 60.r),
                      SizedBox(height: 20.h),
                      Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AutoDirectionFormField(
                                    controller: emailController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => cubit.emailValidation(value??''),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      label: const Text('البريد الإلكتروني'),
                                      hintText: 'أدخل بريدك الإلكتروني',
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
                                    controller: passwordController,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      label: const Text('كلمة المرور'),
                                      hintText: 'أدخل كلمة المرور',
                                      prefix: Padding(
                                        padding: const EdgeInsetsDirectional.only(end:8.0),
                                        child: SvgPicture.asset(SVGAssets.lock,width: 15.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          InkWell(
                            onTap: ()=>Navigator.of(context).pushNamed(StringManager.forgotPasswordRoute),
                            child: Text(
                              'نسيت كلمة المرور؟',
                              style: getLinkStyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      state is LoginLoadingEmail?  const SpinKitThreeBounce(color: ColorManager.primary,size: 25):
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: ()async{
                                await cubit.login(emailController.text,passwordController.text);
                                if(FirebaseAuth.instance.currentUser != null){
                                  Navigator.of(context).pushReplacementNamed(StringManager.homeRoute);
                                }
                              }, 
                              child: Text('تسجيل الدخول',style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),),
                              ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: ()=> Navigator.of(context).pushNamed(StringManager.registerRoute),
                        child: Text(
                          'ليس لديك حساب؟ قم بإنشاء حساب جديد.',
                          style: getLinkStyle(fontSize: FontSize.s12),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 100.w,
                            height: 1,
                            color: ColorManager.primaryExtraDark,
                          ),
                          Text('او',style: getBoldStyle(color: ColorManager.primary.withOpacity(0.6),fontSize: FontSize.s18),),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 100.w,
                            height: 1,
                            color: ColorManager.primaryExtraDark,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      //Social Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          state is LoginLoadingGoogle?  const SpinKitThreeBounce(color: ColorManager.primary,size: 25):
                          InkWell(
                            onTap:()async{
                              await cubit.loginWithGoogle();
                              if(FirebaseAuth.instance.currentUser != null){
                                Navigator.of(context).pushReplacementNamed(StringManager.homeRoute);
                              }
                            },
                            child: Container(
                              width: 55.r,
                              height: 55.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorManager.primaryDark),
                              ),
                              child: Center(child: SvgPicture.asset(SVGAssets.google,width: AppSize.s18.r)),
                            ),
                          ),
                          Container(
                            width: 55.r,
                            height: 55.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorManager.primaryDark),
                            ),
                            child: Center(child: SvgPicture.asset(SVGAssets.facebook,width: AppSize.s18.r)),
                          ),
                          Container(
                            width: 55.r,
                            height: 55.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorManager.primaryDark),
                            ),
                            child: Center(child: SvgPicture.asset(SVGAssets.twitter,width: AppSize.s18.r)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
    }),
    );
    
  }
}