import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

class IconTextItem extends StatelessWidget with ImageHelper {
  const IconTextItem({super.key, required this.iconPath, this.widthBetweenIconText, required this.text});
  final String iconPath;
  final String text;
  final double? widthBetweenIconText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        appSvgImage(path: 'calories',height: 16,width: 16,color: ColorsManager.lightGray),
        const SizedBox(width: 4,),
        Expanded(child: Text(text,style: TextStyle(color: ColorsManager.gray,fontSize: 14.sp),overflow: TextOverflow.ellipsis,)),

      ],
    );
  }
}
