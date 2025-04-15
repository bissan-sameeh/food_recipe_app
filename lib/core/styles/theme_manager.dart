import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/auth/presentaion/widgets/custom_icon_text.dart';

import 'colors_manager.dart';


abstract class ThemeManager{
  static ThemeData getThemeData(){

    return ThemeData(
      scaffoldBackgroundColor: ColorsManager.white,
      fontFamily: 'SofiaPro',
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManager.secondaryLightColor,
        secondary: ColorsManager.secondaryLightColor,
      ),
      appBarTheme:  AppBarTheme(
        backgroundColor: ColorsManager.white,


        elevation: 0,
         foregroundColor: ColorsManager.black,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 24,color: ColorsManager.black,fontWeight: FontWeight.bold,),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  ColorsManager.white,
        ),

      ),
      
      textTheme: TextTheme(bodyMedium: TextStyle(color: ColorsManager.blackText,fontSize: 20.sp,fontWeight: FontWeight.bold,),bodySmall: TextStyle(color: ColorsManager.black,fontSize: 16.sp,fontWeight: FontWeight.bold)),
      buttonTheme: ButtonThemeData(splashColor: ColorsManager.transparent,

      hoverColor: ColorsManager.transparent,
        highlightColor: ColorsManager.transparent
      ),
      floatingActionButtonTheme:  FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.black,
        hoverColor: ColorsManager.transparent,
        elevation: 0,
        splashColor: ColorsManager.transparent,


      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: ColorsManager.white,

            elevation: 0,
      ),
      splashColor: ColorsManager.transparent,
      highlightColor: ColorsManager.transparent,
      hoverColor: ColorsManager.transparent,



    );
  }
}