import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/search/presentaion/widgets/ediroe_choice/editor_item.dart';

import '../../../../../core/models/meal_model/meal_model.dart';

class EditorList extends StatelessWidget {
  const EditorList({super.key, required this.meals});
   final List<MealModel>? meals;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final meal=meals?[index];
          return EditorItem(imagePath:meal?.strMealThumb ?? 'ss', strMeal: meal!.strMeal);
        }, separatorBuilder: (context, index) {
      return SizedBox(
        height: 12.h,
      );
    }, itemCount: meals?.length ??0 );
  }
}
