import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context) => RegisterCubit(),
    child: BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: SvgPicture.asset(Assets.back_button,width: 35.r)),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('إنشاء حساب',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s18.sp)),
                    SizedBox(height: 20.h),
                    SvgPicture.asset(Assets.user_circle,width: 60.r),
                    SizedBox(height: 20.h),
                    Form(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    label: const Text('الاسم'),
                                    hintText: 'أدخل اسمك كاملاً',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(Assets.user,width: 15.r),
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
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    label: const Text('البريد الإلكتروني'),
                                    hintText: 'أدخل بريدك الإلكتروني',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(Assets.email,width: 15.r),
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
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    label: const Text('كلمة المرور'),
                                    hintText: 'أدخل كلمة المرور',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(Assets.lock,width: 15.r),
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
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    label: const Text('تأكيد كلمة المرور'),
                                    hintText: 'أدخل كلمة المرور مرة أخرى',
                                    prefix: Padding(
                                      padding: const EdgeInsetsDirectional.only(end:8.0),
                                      child: SvgPicture.asset(Assets.lock,width: 15.r),
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
                          onTap: ()=>Navigator.of(context).pushNamed('/forgotPassword'),
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: getLinkStyle(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: (){}, 
                            child: Text('تسجيل الدخول',style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),),
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'لديك حساب بالفعل؟ تسجيل الدخول.',
                        style: getLinkStyle(fontSize: FontSize.s12),
                      ),
                    ),
                    SizedBox(height: 15.h),
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
                        Container(
                          width: 55.r,
                          height: 55.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.primaryDark),
                          ),
                          child: Center(child: SvgPicture.asset(Assets.google,width: AppSize.s18.r)),
                        ),
                        Container(
                          width: 55.r,
                          height: 55.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.primaryDark),
                          ),
                          child: Center(child: SvgPicture.asset(Assets.facebook,width: AppSize.s18.r)),
                        ),
                        Container(
                          width: 55.r,
                          height: 55.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.primaryDark),
                          ),
                          child: Center(child: SvgPicture.asset(Assets.twitter,width: AppSize.s18.r)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }),
    );
    
  }
}