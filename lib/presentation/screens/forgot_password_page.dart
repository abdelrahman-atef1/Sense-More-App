import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sense_more/business_logic/cubit/forget_password_cubit/forgot_password_cubit.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/auto_direction_text_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context) => ForgotPasswordCubit(),
    child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state){
        var cubit = BlocProvider.of<ForgotPasswordCubit>(context);
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ColorManager.lightPink,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: SvgPicture.asset(SVGAssets.backButton,width: 35.r)),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Row(
                              children: [
                                Text('نسيت كلمة المرور',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s18.sp)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                    'قم بإدخال الايميل الصحيح ليتم ارسال رابط استعادة كلمة المرور',
                                    style: getBoldStyle(
                                        color: ColorManager.primaryDark.withOpacity(0.85),
                                        fontSize: FontSize.s12.sp)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AutoDirectionFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) => cubit.emailValidation(value??''),
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
                                ),],
                            )),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: (){
                                    cubit.resetPassword(emailController.text,context);
                                  }, 
                                  child: Text('إرسال',style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),),
                                  ),
                              ),
                            ],
                          ),],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }),
    );
    
  }
}