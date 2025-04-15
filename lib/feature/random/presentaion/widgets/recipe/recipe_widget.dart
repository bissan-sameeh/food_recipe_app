import 'dart:math';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/random/presentaion/widgets/recipe/recipe_list.dart';

import '../../../../../../core/helper/image_helper.dart';
import '../../../../../../core/widgets/custom_list_tile.dart';
import '../../bloc/random_bloc.dart';

class RecipeWidget extends StatelessWidget with ImageHelper {
  const RecipeWidget({super.key, this.widthContainer=200, this.heightContainer=128, this.heightSizedBox=220,  this.isSearchScreen=false});
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
          const CustomListTile(
            leading: 'Popular Recipe',
            trailing: 'see more',
          ),
          SizedBox(
            height: 12.h,
          ),
          BlocBuilder<RandomBloc, RandomState>(
            builder: (context, state) {
              if(state is RandomSuccessState){
                return RecipeList(
                  isSearchScreen:isSearchScreen,
                  meals: state.meals,widthContainer: widthContainer,
                  heightContainer: heightContainer,
                  heightSizedBox: heightSizedBox,);
              }else if(state is RandomFailedState){
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
