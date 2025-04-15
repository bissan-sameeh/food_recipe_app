import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors_manager.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({super.key, required this.subTitle});
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(subTitle,
      style: TextStyle(
      color: ColorsManager.darkGray,
      fontSize: 14.sp
    ),
   maxLines: 2,

    );
  }
}
