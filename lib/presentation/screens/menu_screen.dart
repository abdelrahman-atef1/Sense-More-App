import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/data/models/side_menu_model.dart';
import 'package:sense_more/presentation/widgets/home_top_section.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Top Section
                TopSectionHome(user: getIt<LoginCubit>().loggedInUser),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                        shrinkWrap: true,
                        children: buildSettingsItems(context,menuItems)),
                  ),
                )
              ],
            ),
          );
  }
}
  List<SideMenuModel> menuItems = [
       const SideMenuModel(
            icon: CupertinoIcons.profile_circled,
            name: 'Profile Details',
            routeName: StringManager.profileRoute),
       const SideMenuModel(
            icon: CupertinoIcons.settings,
            name: 'Settings',
            routeName: StringManager.settingsRoute),
       const SideMenuModel(
            icon: Icons.logout,
            name: 'Log Out',
            routeName: StringManager.loginRoute),
  ];
  
List<Widget> buildSettingsItems(BuildContext context,List<SideMenuModel> items){
  return items.map((item) {
    bool isLogout = item.routeName == StringManager.loginRoute;
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSize.s8)
      ),
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(10),
    child: ListTile(
        minLeadingWidth: 20,
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: ColorManager.primaryLight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppSize.s8)
          ),
          child: Icon(item.icon,color: isLogout?ColorManager.error : ColorManager.primary,size: 30.r,)),
        title: Text(item.name, style: getBoldStyle(fontSize: FontSize.s20.sp,color: isLogout? ColorManager.error : ColorManager.black)),
        onTap: () {
          if(isLogout){
            Navigator.of(context, rootNavigator: true).pushReplacementNamed(item.routeName);
          }else{
            Navigator.of(context,rootNavigator: true).pushNamed(item.routeName);
          }
        },
      ),
  );
  }).toList();
}
