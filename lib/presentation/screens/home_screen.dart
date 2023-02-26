import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/presentation/widgets/announcment_widget.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final HomeCubit cubit = getIt();
          state.whenOrNull(
              bluetoothDummySearch: (nearestDevice) => debugPrint('NearestDevice: ${nearestDevice.name}'));
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Top Section
                TopSectionHome(user: getIt<LoginCubit>().loggedInUser),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    children: [
                      Container(
                        width: 20.r,
                        height: 20.r,
                        margin: const EdgeInsetsDirectional.only(end: 10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.primary),
                        child: Icon(Icons.refresh,
                            size: 15.r, color: ColorManager.white),
                      ),
                      const Text('Updates'),
                      const Spacer(),
                      Text(
                        '5 mins ago',
                        style:
                            getMediumStyle(color: ColorManager.greyTextOpacity,fontSize: FontSize.s12.sp),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'There\'s no new updates!',
                  style:
                      getMediumStyle(color: ColorManager.title1,fontSize: FontSize.s12.sp),
                ),
                const SizedBox(height: 10),
                // UserDataWidget(
                //   user: cubit.firebaseUser!,
                //   color: ColorManager.primary,
                //   roomNumber: getIt<BluetoothHelper>()
                //           .nearestDevice
                //           ?.device
                //           .name
                //           .toString() ??
                //       'Out of range',
                //   rssi:
                //       getIt<BluetoothHelper>().nearestDevice?.rssi.toString() ??
                //           'Out of range',
                // ),
                // Text('User Name: ${cubit.firebaseUser?.displayName??'-'}'),
                // Text('User ID: ${cubit.firebaseUser?.uid??'-'}'),
                // Text('Current Room: ${cubit.firebaseUser?.displayName??'-'}'),
                const Divider(),
                Text(
                  'Announcements',
                  style: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: 20.sp),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.allAnnouncements.length,
                      itemBuilder: (ctx, i) => AnnouncementItem(
                            announcementModel: cubit.allAnnouncements[i],
                          )),
                )
              ],
            ),
          );
  });
  }
}

