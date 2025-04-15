import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

import '../../../../../core/consants.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/custom_list_tile.dart';
import '../../../../../core/widgets/btn_widget.dart';
import '../../../../ingradients/presentaion/cubit/ingredient_reader/ingredient_reader_cubit.dart';
import '../../../../ingradients/presentaion/widgets/ingredient_widgets/ingredient_instruction_btn.dart';
import '../../../../ingradients/presentaion/widgets/ingredient_widgets/ingredient_widget.dart';
import '../../../../random/presentaion/widgets/recipe/recipe_widget.dart';
import '../../../domain/entity/details_entity.dart';
import '../chip_container_widget.dart';
import '../details_list.dart';
import '../sub_title_widget.dart';
import '../title_widget.dart';

class DetailsWidgets extends StatelessWidget with ImageHelper {
   DetailsWidgets({super.key, required this.meal});
   final List<MealModel>? meal;
    late MealModel mealItem;


  @override
  Widget build(BuildContext context) {
    mealItem=meal![0];
    List<DetailsEntity> details=[
      DetailsEntity(icon: 'carbs', description: mealItem.strMeasure1!,),
      DetailsEntity(icon: 'calories', description: mealItem.strIngredient1!,),
      DetailsEntity(icon: 'fats', description: mealItem.strMeasure2!,),
      DetailsEntity(icon: 'proteins', description:mealItem.strIngredient2!),
    ];
    return        Stack(
      fit: StackFit.expand,
      children: [
        fancyShimmer(
            imagePath:mealItem.strMealThumb!,
            height: 100),

        //shade
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    ColorsManager.white.withOpacity(0.9),
                    ColorsManager.transparent,
                    


                  ])

          ),),
        const PositionedDirectional(
          top: 30,
          start: 16,
          child: BtnWidget(
            path: 'close',
          ),
        ),
        const PositionedDirectional(
          top: 30,
          end: 16,
          child: BtnWidget(),
        ),
        PositionedDirectional(
          end: 0,
          start: 0,
          bottom: 0,
          height: MediaQuery
              .of(context)
              .size
              .height
              .h / 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: cornerDetails, topLeft: cornerDetails),
              color: ColorsManager.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 22.0.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChipContainerWidget(),
                    SizedBox(height: 21.h,),

                     TitleWidget(strMeal: mealItem.instructions!,),
                     SubTitleWidget(subTitle:mealItem.strMeal,),
                    DetailsList(details: details,),
                    SizedBox(height: 24.h,),

                    const IngredientInstructionBtn(),

                    SizedBox(height: 24.h,),
                    BlocBuilder<IngredientReaderCubit, IngredientReaderState>(
                      builder: (context, state) {
                        final recipe = context.read<IngredientReaderCubit>().recipe;

                        if (recipe == Recipe.Ingredient) {
                          return const Column(
                            children: [
                              CustomListTile(
                                leading: 'Ingredient',
                                trailing: 'Add All to cart',
                              ),
                              IngredientWidget(),
                               RecipeWidget(
                                isSearchScreen: true,
                                heightSizedBox: 170,heightContainer: 90,widthContainer: 100,),

                            ],
                          );
                        }
                        else {
                          return const Column(
                            children: [
                              CustomListTile(
                                leading: 'Instructions',
                                trailing: '',
                              ),
                            ],
                          );
                        }
                      },
                    ),




                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
    ;
  }
}
