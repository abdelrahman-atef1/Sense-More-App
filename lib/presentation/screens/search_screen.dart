import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/search_cubit/search_cubit.dart';
import 'package:sense_more/core/shared/assets_manager.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';
import 'package:sense_more/presentation/widgets/top_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getIt<LoginCubit>().loggedInUser;
    // var cubit = getIt<SearchCubit>();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child:  Scaffold(
            body:  Column(
              children: [
                TopSection(
                  height: 120.h,
                  child: Center(
                    child: Text(
                      'Find Employee',
                      style: getBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s20.sp),
                    ),
                  ),
                ),
                user?.isManager == true? Image.asset(Assets.noAccess):
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        //Name & Title
                        Row(
                          children: [
                            Expanded(
                              child: user == null
                                  ? const TextShimmer()
                                  : Text(
                                      user.fullName ?? '-',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: getBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: FontSize.s18.sp),
                                    ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: user == null?
                              const TextShimmer():
                              Text(
                                user.jobTitle ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getRegularStyle(
                                    color: ColorManager.greyText,
                                    fontSize: FontSize.s14.sp),
                              ),
                            ),
                          ],
                        ),
                        //Search Type Tabs
                        BlocBuilder<SearchCubit, SearchState>(
                          buildWhen: (previous, current) => current.maybeWhen(
                              changeSearchFilter: (selectedFloorNumber) => true, orElse: () => false),
                          builder: (context, state) {
                            var cubit = BlocProvider.of<SearchCubit>(context);
                            return Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.white,
                                            borderRadius: BorderRadius.circular(AppSize.s8),
                                            boxShadow: const [BoxShadow(color: Colors.black12,offset: Offset(0, 4),blurRadius: 7)]
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'E.G. Mathew',
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedErrorBorder: InputBorder.none,
                                              suffixIcon: Padding(
                                                padding: const EdgeInsetsDirectional.only(end:8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      onPressed: ()=> cubit.showFilterDialogue(context),
                                                      icon: Icon(cubit.selectedFloorNumber==null? 
                                                              Icons.filter_list_rounded 
                                                            : Icons.filter_list_off_rounded
                                                            )),
                                                    Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(math.pi),
                                                        child: const Icon(CupertinoIcons.search),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 10,
                                            itemBuilder: (_,i)=> Container(
                                              margin: const EdgeInsets.symmetric(vertical: 5),
                                              padding: EdgeInsets.symmetric(horizontal:15.w,vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(AppSize.s8),
                                                border: Border.all(color: ColorManager.primary)
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Abdelrahman Atef',style: getBoldStyle(color: ColorManager.darkGrey),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('@HRAbdelrahman',style: getRegularStyle(color: ColorManager.greyTextOpacity,height: 1.4),),
                                                      Text('#1st Floor',style: getSemiBoldStyle(fontSize: FontSize.s12.sp,color: ColorManager.primary,height: 1.4)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class TabItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback? onTap;
  const TabItem({
    Key? key,
    required this.isSelected,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: getBoldStyle(
                fontSize: FontSize.s22.sp,
                color:
                    isSelected ? ColorManager.primary : ColorManager.greyText),
          ),
          Container(
            width: 12.r,
            height: 12.r,
            decoration: !isSelected? null:
            const BoxDecoration(
              shape: BoxShape.circle,
              gradient:  LinearGradient(
                  colors: [ColorManager.primaryDark, ColorManager.primary]),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 5)
              ],
            ),
          )
        ],
      ),
    );
  }
}
