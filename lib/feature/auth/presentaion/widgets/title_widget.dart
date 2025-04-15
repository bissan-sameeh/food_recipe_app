import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors_manager.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return     Text(text,style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 20.sp),textAlign: TextAlign.center,);
  }
}
