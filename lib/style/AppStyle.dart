import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/style/AppColors.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Appcolors.primaryColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13.sp,
        color: Appcolors.greyColor,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: Appcolors.greyColor,
      ),
      titleSmall: TextStyle(
        color: Appcolors.greyColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        color: Appcolors.iconColor,
        fontWeight: FontWeight.w700
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700
      )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25.sp
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        )
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22.sp,
        color: Colors.white,
      )
    ),
    useMaterial3: true,
  );
}