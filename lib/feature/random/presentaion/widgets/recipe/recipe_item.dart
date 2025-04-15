import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/random/presentaion/widgets/ingradients_widget.dart';

import '../../../../../core/styles/colors_manager.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/container_image.dart';
import '../../../../../core/widgets/btn_widget.dart';


class RecipeItem extends StatelessWidget with ImageHelper {
  const RecipeItem({super.key, required this.mealModel,    this.widthContainer = 200,
    this.heightContainer = 128, this.isSearchScreen=false});
  final MealModel mealModel;
  final double? widthContainer;
  final double? heightContainer;
  final bool? isSearchScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthContainer!.w,
      padding: EdgeInsets.symmetric(
          horizontal:isSearchScreen ==true?  8.w: 16.w, vertical: isSearchScreen ==true?  8.w: 16.h),
      decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: buildBorderRadiusDirectional,
          boxShadow: [
            boxShadow(),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ContainerImage(imagePath: mealModel.strMealThumb!,heightContainer: heightContainer,bottomMargin: 12,)

              ,if(isSearchScreen !=true) const PositionedDirectional(
                  top: 8,
                  end: 8,
                  child: BtnWidget()
              ),
            ],
          ),
          // recipe name
          Expanded(
              child: Text(
                mealModel.strMeal ?? 'ssssssssssss' ,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
           SizedBox(height: 8.h,),
          if(isSearchScreen!=true) IngradientWidget(strMeasure1: mealModel.strMeasure1!, strIngredient1: mealModel.strIngredient1!)
        ],
      ),
    );
  }
}
