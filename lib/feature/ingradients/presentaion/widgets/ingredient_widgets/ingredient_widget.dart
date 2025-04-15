import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';
import 'package:food_recipe/feature/ingradients/presentaion/widgets/ingredient_widgets/ingredient_item.dart';
import 'package:food_recipe/feature/search/presentaion/widgets/ediroe_choice/editor_item.dart';

import '../../../../../core/models/meal_model/meal_model.dart';
import '../../bloc/ingredient/ingredient_bloc.dart';
import 'ingredient_list.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, });
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<IngredientBloc, IngredientState>(
  builder: (context, state) {
    if(state is IngredientSuccessState){

    return IngredientList(mealsIng: state.ingredients,);
    }else if(state is IngredientFailedState){
      return CustomErrorWidget(text: state.message);
    }else{
      return const LoadingWidget();
    }
  },
);
  }
}
