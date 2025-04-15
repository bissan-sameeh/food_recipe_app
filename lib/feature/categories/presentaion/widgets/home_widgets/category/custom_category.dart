import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';

import '../../../../../../core/models/meal_model/meal_model.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key,  this.categoryModel,  this.mealModel, this.onTap});
  final CategoryModel? categoryModel;
  final MealModel? mealModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
       padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 9.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(40.r),

        ),
        child: Text(categoryModel ==null ? mealModel!.strMeal :categoryModel!.strCategory ?? 'Dinner',style: TextStyle(color: ColorsManager.white) ,),
      ),
    );
  }
}
