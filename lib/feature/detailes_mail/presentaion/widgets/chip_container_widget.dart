import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

import '../../../../core/styles/styles.dart';

class ChipContainerWidget extends StatelessWidget {
  const ChipContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.w,
        height: 8.h,
        alignment: Alignment.center,
       // padding: EdgeInsets.symmetric(horizontal:12.w ,vertical:30.w ),
        decoration: BoxDecoration(
          borderRadius: buildBorderRadiusDirectional,
          color: ColorsManager.grayLight100,
        ),
      ),
    );
  }
}
