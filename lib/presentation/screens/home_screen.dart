import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/bluetooth_helper.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/data/models/side_menu_model.dart';
import 'package:sense_more/presentation/widgets/announcment_widget.dart';
import 'package:sense_more/presentation/widgets/user_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryLight,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ZoomDrawer(
              style: DrawerStyle.defaultStyle,
              mainScreenTapClose: true,
              isRtl: Directionality.of(context) == TextDirection.rtl,
              menuScreen: MenuScreen(),
              mainScreen: const MainScreen());
        },
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final HomeCubit cubit = getIt();

List<SideMenuModel> menuItems(BuildContext context) => [
  SideMenuModel(name: 'البروفايل', icon: Icons.person, onClick: () async{
    await Navigator.of(context).pushNamed(StringManager.profileRoute);
    cubit.reloadUser();
  }),
  SideMenuModel(name: 'الإعدادات', icon: Icons.settings, onClick: () =>Navigator.of(context).pushNamed(StringManager.settingsRoute)),
  SideMenuModel(name: 'تسجيل الخروج', icon: Icons.logout, onClick: () => getIt.get<LoginCubit>().signOut(context)),
];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManager.primaryLight,
            body: state.maybeWhen(
              loading: () => const SpinKitThreeBounce(
                size: 25,
                color: ColorManager.primary,
              ),
              orElse: () => Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UserDataWidget(user: cubit.firebaseUser!),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: menuItems(context).map((e) => buildMenuItem(e)).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = getIt();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        state.whenOrNull(bluetoothSearch: (nearestDevice) =>print('asdasdasd'+nearestDevice.device.name));
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => ZoomDrawer.of(context)?.toggle(),
                icon: const Icon(Icons.menu)),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserDataWidget(
                user: cubit.firebaseUser!,
                color: ColorManager.primary,
                roomNumber: getIt<BluetoothHelper>().nearestDevice?.device.name.toString()??'Out of range',
                rssi: getIt<BluetoothHelper>().nearestDevice?.rssi.toString()??'Out of range',
                ),
              // Text('User Name: ${cubit.firebaseUser?.displayName??'-'}'),
              // Text('User ID: ${cubit.firebaseUser?.uid??'-'}'),
              // Text('Current Room: ${cubit.firebaseUser?.displayName??'-'}'),
              Divider(),
              Text('Announcments',style: getSemiBoldStyle(color: ColorManager.primaryDark,fontSize: 20.sp),),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.allAnnouncments.length,
                  itemBuilder: (ctx,i)=> AnnouncmentItem(announcmentModel: cubit.allAnnouncments[i],)),
              )
            ],
          ),
        );
      },
    );
  }
}



Widget buildMenuItem(SideMenuModel item) => ListTile(
      minLeadingWidth: 20,
      leading: Icon(item.icon, color: Colors.white),
      title: Text(item.name, style: const TextStyle(color: Colors.white)),
      onTap: item.onClick,
    );
