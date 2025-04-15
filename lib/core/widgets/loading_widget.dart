import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 30.w,
          height: 30.h,
          child: CircularProgressIndicator(
            color: ColorsManager.secondaryLightColor,
          )),
    );
  }
}
