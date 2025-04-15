import 'package:food_recipe/core/api_helper/api_consumer.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import '../../../../core/api_helper/end_points.dart';
import '../../../../core/models/meal_model/meal_base_response.dart';


abstract class RandomRemoteDataSource{
  Future<List<MealModel>?> getRandom();

}

class RandomRemoteDataSourceImp implements RandomRemoteDataSource{
  ApiConsumer api;
  RandomRemoteDataSourceImp({required this.api});

  @override
  Future<List<MealModel>?> getRandom() async {
      final  response=await api.get(EndPoints.random);
      final baseResponse = MealBaseResponse.fromJson(response);
      return  baseResponse.meals   ;
  }





  // @override
  // Future<List<MealModel>?> searchByArea({required String areaName}) async {
  //   final  response=await api.get(EndPoints.filterByArea+areaName);
  //   final baseResponse = MealBaseResponse.fromJson(response);
  //   return  baseResponse.meals  ;
  // }

  // @override
  // Future<List<MealModel>?> searchByCategory({required String category}) async {
  //   final  response=await api.get(EndPoints.filterByCategory+category);
  //   final baseResponse = MealBaseResponse.fromJson(response);
  //   return  baseResponse.meals  ;
  // }

}