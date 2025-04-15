import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/random/presentaion/widgets/ingradients_widget.dart';

import '../../../../../core/styles/colors_manager.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/container_image.dart';
import '../../../../../core/widgets/favorite_widget.dart';
import '../../../data/models/favorite_meal_model.dart';
import '../../bloc/cubit/favorite_cubit.dart';

class FavoriteItem extends StatelessWidget with ImageHelper {
  const FavoriteItem(
      {super.key,
      required this.mealModel,
      this.widthContainer = 200,
      this.heightContainer = 128,
      this.onTap});

  final FavoriteMealModel mealModel;
  final double? widthContainer;
  final double? heightContainer;
  final Function()? onTap;

  // final String mealId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Container(
          width: widthContainer!.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
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
                  ContainerImage(
                    imagePath: mealModel.strMealThumb,
                    heightContainer: heightContainer,
                    bottomMargin: 12,
                  ),
                  PositionedDirectional(
                      top: 8,
                      end: 8,
                      child: FavoriteWidget(
                        mealId: mealModel.id,
                        onTap: () {
                          context.read<FavoriteCubit>().toggleFavorite(
                              MealModel(
                                  idMeal: mealModel.id,
                                  strMealThumb: mealModel.strMealThumb,
                                  strMeal: mealModel.strMeal));
                        },
                      )),
                ],
              ),
              // recipe name
              Expanded(
                  child: Text(
                mealModel.strMeal ?? 'ssssssssssss',
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
