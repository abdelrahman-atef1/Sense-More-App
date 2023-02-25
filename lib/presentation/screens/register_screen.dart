import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_state.dart';
import 'package:sense_more/core/shared/Utilities/validation.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state){
      var cubit = getIt<RegisterCubit>();
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
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
                              child: cubit.pickedImage?.path != null?
                              Image.file(cubit.pickedImage!,fit: BoxFit.cover,):
                              SvgPicture.asset(SVGAssets.userCircle,width: 60.r),
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
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: AutoDirectionFormField(
                                  obscureText: true,
                                  controller: cubit.passwordController,
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
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: AutoDirectionFormField(
                                  obscureText: true,
                                  controller: cubit.passwordConfirmationController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) => passwordValidation(value??'',cubit.passwordController.text),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    label: const Text('تأكيد كلمة المرور'),
                                    hintText: 'أدخل كلمة المرور مرة أخرى',
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
                    //Radio
                    BlocBuilder<RegisterCubit, RegisterState>(
                      buildWhen: (previous, current) => current.mapOrNull(changeUserType: (isManager)=>true)??false,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: ()=> cubit.changeType(true),
                                child: Row(
                                  children: [
                                    Radio<bool>(
                                        value: true,
                                        groupValue: cubit.isManager,
                                        onChanged: (checked) => cubit.changeType(true)),
                                    Text(
                                      'Manager',
                                      style: TextStyle(
                                          color: cubit.isManager == true
                                              ? ColorManager.primary
                                              : ColorManager.disabled),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: ()=> cubit.changeType(false),
                                child: Row(
                                  children: [
                                    Radio<bool>(
                                        value: false,
                                        groupValue: cubit.isManager,
                                        onChanged: (checked) => cubit.changeType(false)),
                                    Text(
                                      'Employee',
                                      style: TextStyle(
                                          color: cubit.isManager == false
                                              ? ColorManager.primary
                                              : ColorManager.disabled),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
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
                    Row(
                      children: [
                        state.maybeWhen(
                          loadingEmail: () => const Expanded(
                              child: Center(
                                  child: SpinKitThreeBounce(
                                      color: ColorManager.primary, size: 25))),
                          orElse: () => Expanded(
                            child: FilledButton(
                              onPressed: () async {
                                await cubit.registerWithEmail(
                                    cubit.emailController.text,
                                    cubit.fullNameController.text,
                                    cubit.passwordController.text,
                                    cubit.passwordConfirmationController.text);
                                if (FirebaseAuth.instance.currentUser != null) {
                                  Navigator.of(context).pushReplacementNamed(
                                      StringManager.homeRoute);
                                }
                              },
                              child: Text(
                                'إنشاء حساب',
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s14),
                              ),
                            ),
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
                          color: ColorManager.primaryDark,
                        ),
                        Text('او',style: getBoldStyle(color: ColorManager.primary.withOpacity(0.6),fontSize: FontSize.s18),),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 100.w,
                          height: 1,
                          color: ColorManager.primaryDark,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    //Social Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        state.maybeWhen(
                          loadingGoogle:()=> const SpinKitThreeBounce(color: ColorManager.primary,size: 25),
                          orElse: ()=> InkWell(
                          onTap: () async{
                            await cubit.registerWithGoogle();
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
        );
    });
    
  }
}