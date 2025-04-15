import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/ingradients/presentaion/cubit/ingredient_reader/ingredient_reader_cubit.dart';

import '../../../../../core/consants.dart';
import '../../../../../core/styles/colors_manager.dart';
import '../../../../../core/styles/styles.dart';

class IngredientInstructionBtn extends StatelessWidget {
  const IngredientInstructionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientReaderCubit, IngredientReaderState>(
      builder: (context, state) {
        final cubit = context.read<IngredientReaderCubit>();
        final selectedRecipe = cubit.recipe;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          decoration: BoxDecoration(
              color: ColorsManager.grayLight100,
              borderRadius: buildBorderRadiusDirectional),
          child: Row(
            children: [
              Expanded(
                  child: _buildContainer(context,
                      text: 'Ingredient',
                      recipe: Recipe.Ingredient,
                      isSelected: selectedRecipe == Recipe.Ingredient)),
              Expanded(
                child: _buildContainer(context,
                    text: 'Instructions',
                    recipe: Recipe.Instructions,
                    isSelected: selectedRecipe == Recipe.Instructions),
              )
            ],
          ),
        );
      },
    );
  }
}

_buildContainer(BuildContext context,
    {required String text, required Recipe recipe, required bool isSelected}) {
  return InkWell(
    onTap: () {
      context.read<IngredientReaderCubit>().updateRecipe(recipe);
    },
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius:
              isSelected == true ? buildBorderRadiusDirectional : null,
          color: isSelected == true ? ColorsManager.black : null),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? ColorsManager.white : ColorsManager.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
