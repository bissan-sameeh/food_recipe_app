import 'package:food_recipe/core/api_helper/api_consumer.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import '../../../../core/api_helper/end_points.dart';
import '../../../../core/models/meal_model/meal_base_response.dart';


abstract class DetailsMealsRemoteDataSource{
  Future<List<MealModel>?> getMealsDetails({required String mealId});

}


class DetailsMealsRemoteDataSourceImp implements DetailsMealsRemoteDataSource {
  ApiConsumer api;

  DetailsMealsRemoteDataSourceImp({required this.api});

  @override
  Future<List<MealModel>?> getMealsDetails({required String mealId}) async {
    final  response=await api.get(EndPoints.mealDetailsById+mealId);
    final baseResponse = MealBaseResponse.fromJson(response);
    return  baseResponse.meals  ;
  }


}