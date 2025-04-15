

import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_ingredient_base_response.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

import '../../../../core/api_helper/api_consumer.dart';
import '../../../../core/api_helper/end_points.dart';
import '../../../../core/models/meal_model/meal_base_response.dart';

abstract class IngredientsRemoteDataSource{
  Future<List<MealIngredient>?> getIngredient();
}

class IngredientsRemoteDataSourceImp implements IngredientsRemoteDataSource{
  ApiConsumer api;
  IngredientsRemoteDataSourceImp({required this.api});



  @override
  Future<List<MealIngredient>?> getIngredient() async {
    final  response=await api.get(EndPoints.listAllIngredients);
    final baseResponse = MealIngredientBaseResponse.fromJson(response);
    print("ressssssssssssssssssssssssssssssssssssssssssssssss $baseResponse");
    return  baseResponse.meals ;
  }



}