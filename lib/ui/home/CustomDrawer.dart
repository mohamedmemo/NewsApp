import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart';

class Customdrawer extends StatelessWidget {
  void Function(DrawerTabs) onPress;
  static const int categoriesNumbe = 0;
  static const int settingsNumber = 1;

  Customdrawer({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 43),
              child: Text("News App !", style: Theme.of(context).textTheme.headlineMedium,),
            )
        ),
        SizedBox(height: 29.h,),
        InkWell(
          onTap: () {
            onPress(DrawerTabs.CATEGORIES);
          },
          child: Padding(
            padding: REdgeInsets.only(left: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/lsit_icon.svg',
                  height: 22.h,
                  width: 25.w,
                ),
                SizedBox(width: 16.w,),
                Text('Categories',style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
        ),
        SizedBox(height: 23.h,),
        InkWell(
          onTap: () {
            onPress(DrawerTabs.SETTINGS);
          },
          child: Padding(
            padding: REdgeInsets.only(left: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/settings_icon.svg',
                  height: 22.h,
                  width: 25.w,
                ),
                SizedBox(width: 16.w,),
                Text('settings',style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
