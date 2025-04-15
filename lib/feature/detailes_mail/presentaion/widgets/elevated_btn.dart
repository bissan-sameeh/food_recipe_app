import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';
import 'package:food_recipe/core/styles/styles.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({super.key,  this.onPressed, required this.iconData});
  final Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 12.w),
            // () {
          // context.read<RecipeDetailBloc>().add(
          //   AddAllIngredientsToCart(widget.recipe.ingredients),
          // );
        // },
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10.r),
          color: ColorsManager.white,
          border: Border.all(color: ColorsManager.secondaryLightColor)
        ),


       child:  Icon(iconData,size: 20.r,color: ColorsManager.secondaryLightColor,),
      ));
  }
}
