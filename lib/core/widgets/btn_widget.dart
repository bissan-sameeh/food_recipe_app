import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';

import '../styles/colors_manager.dart';

class BtnWidget extends StatelessWidget with ImageHelper {
  const BtnWidget({super.key, required this.path, this.iconColor, this.backgroundColor, this.onTap});

  final String path;
  final Color? iconColor;
  final Color? backgroundColor;
  final Function () ? onTap;

  @override
  Widget build(BuildContext context) {
    return        InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 5.6.h, horizontal: 5.6.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.white,
          borderRadius:
          BorderRadiusDirectional.circular(8.r),
        ),
        child: appSvgImage(
            path: path  ,
            color: iconColor ?? ColorsManager.black,
            width: 17,
            height: 17),
      ),
    );
    ;
  }
}
