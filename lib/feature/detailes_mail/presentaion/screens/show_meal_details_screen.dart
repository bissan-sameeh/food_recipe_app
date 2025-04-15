import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';

import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/details_successs_widdget/details_widgets.dart';
import 'package:food_recipe/feature/ingradients/presentaion/bloc/ingredient/ingredient_bloc.dart';

import '../bloc/details_meal_bloc/details_meal_bloc.dart';


class ShowMealDetailsScreen extends StatefulWidget  {
  const ShowMealDetailsScreen({super.key});

  @override
  State<ShowMealDetailsScreen> createState() => _ShowMealDetailsScreenState();
}

class _ShowMealDetailsScreenState extends State<ShowMealDetailsScreen> with ImageHelper {
  String? mealId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      if(mounted){
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        mealId = args['mealId'];
        if (mealId != null) {
          context.read<DetailsMealBloc>().add(GetMealsDetailsEvent(mealId: mealId!));
          context.read<IngredientBloc>().add(const GetIngredientEvent());
        }

        }
      }});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsMealBloc, DetailsMealState>(
        builder: (context, state) {
      if(state is DetailMealSuccessState) {
        final meal=state.meals;
        if(meal!.isEmpty ){
          return const Center(child: Text("No data!"));
        }
        return DetailsWidgets(meal: state.meals );
      }
      else if(state is DetailMealFailedState){
        return CustomErrorWidget(text: state.message);
      }else{
        return const LoadingWidget();
      
      }
      
      },
      ),
    );
  }
}
