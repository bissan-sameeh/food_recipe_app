import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/sub_title_widget.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';
import 'package:food_recipe/feature/ingradients/presentaion/widgets/ingredient_widgets/ingredient_item.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.mealsIng});
  final List<MealIngredient> mealsIng;

  @override
  Widget build(BuildContext context) {
    return  Column
      (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget( subTitle: '${mealsIng.length} items',),

        ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return IngredientItem( strIngredient: mealsIng[index].strIngredient!, idIngredient:mealsIng[index].idIngredient!,);
            }, separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.h,
          );
        }, itemCount: mealsIng.length),
      ],
    );
  }
}
