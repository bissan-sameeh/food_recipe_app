import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/widgets/btn_widget.dart';
import 'package:food_recipe/core/widgets/favorite_widget.dart';

import '../../../../core/styles/colors_manager.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.path, required this.description});
  final String path;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BtnWidget(
          backgroundColor: ColorsManager.grayLight100,
          iconColor: ColorsManager.black,
          path: path,

        ),
        const SizedBox(width: 12,),
        Text(description,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),)
      ],
    );
  }
}
