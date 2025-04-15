

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/bloc/cubit/favorite_cubit.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/favorites_widget/favorite_list.dart';

import '../../../../../../core/helper/image_helper.dart';
import '../../../../../../core/widgets/custom_list_tile.dart';

class FavoriteWidgetCustom extends StatelessWidget with ImageHelper {
  const FavoriteWidgetCustom({super.key, this.widthContainer=200, this.heightContainer=128, this.heightSizedBox=220,  this.isSearchScreen=false});
  final double? widthContainer;
  final double? heightContainer;
  final double? heightSizedBox;
  final bool? isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.h, bottom: 24.h),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w),
            child: const CustomListTile(
              leading: 'Favorites',
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if(state is FavoriteGetAllFavorites){
                final favorites = state.meals;

                if (favorites.isEmpty) {
                  return const Center(child: Text('No favorites yet.'));
                }
                return FavoriteList(


                  widthContainer: widthContainer,
                  heightContainer: heightContainer,
                   meals: favorites,);
              }else if(state is FavoriteFailedState){
                return CustomErrorWidget(text: state.message);
              }
              else{
                return const LoadingWidget();
              }
            },
          )
        ],
      ),
    );
  }
}
