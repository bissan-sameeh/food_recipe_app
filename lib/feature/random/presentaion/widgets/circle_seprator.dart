import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors_manager.dart';

class CircleSeprator extends StatelessWidget {
  const CircleSeprator({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
      child: CircleAvatar(radius: 2,backgroundColor: ColorsManager.gray),
    );

  }
}
