import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/random/presentaion/widgets/recipe/recipe_item.dart';

class RecipeList extends StatelessWidget {
  const RecipeList(
      {super.key,
      required this.meals,
      this.widthContainer = 200,
      this.heightContainer = 128,
      this.heightSizedBox = 220,  this.isSearchScreen=false});

  final List<MealModel>? meals;
  final double? widthContainer;
  final double? heightContainer;
  final double? heightSizedBox;
  final bool? isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSizedBox!.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecipeItem(
              isSearchScreen:isSearchScreen,
              mealModel: meals![index],
              heightContainer: heightContainer,
              widthContainer: widthContainer,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 12.w,
              ),
          itemCount: meals!.length),
    );
  }
}
