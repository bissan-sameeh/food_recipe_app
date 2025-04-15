import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

import '../../../../core/styles/styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16),
      margin:              EdgeInsets.all(16.0),

      decoration: BoxDecoration(
        borderRadius: buildBorderRadiusDirectional,
        color: ColorsManager.black
      ),
      child: Text('Login',style: TextStyle(fontSize: 18.sp,color: ColorsManager.white),),
    );
  }
}
