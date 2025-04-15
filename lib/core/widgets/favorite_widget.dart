import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

import '../../feature/detailes_mail/presentaion/bloc/cubit/favorite_cubit.dart';

class FavoriteWidget extends StatelessWidget with ImageHelper {
  const FavoriteWidget(
      {super.key, this.path = 'favorite', this.iconColor, this.backgroundColor, this.onTap, required this.mealId});

  final String path;
  final Color? iconColor;
  final Color? backgroundColor;
  final Function () ? onTap;
  final String mealId;



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(

    builder: (context, state) {
      final isFavorite =
          context.watch<FavoriteCubit>().favoriteMeals[mealId] ?? false;

      return InkWell(
        onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 5.6.h, horizontal: 5.6.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor ?? ColorsManager.white,
              borderRadius:
              BorderRadiusDirectional.circular(8.r),
            ),
            child: appSvgImage(
                path: isFavorite==true ? 'fav_filled' :path  ,
                color: iconColor ?? ColorsManager.secondaryLightColor,
                width: 17,
                height: 17),
          ),
        );
      },
    );
  }
}
