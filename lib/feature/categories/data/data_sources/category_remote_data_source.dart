import 'package:food_recipe/core/api_helper/api_consumer.dart';
import '../../../../core/api_helper/end_points.dart';
import '../models/category_base_response_model.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource{
  Future<List<CategoryModel>?> getAllCategory();
  Future<List<CategoryModel>?> listAllCategory();
}

class CategoryRemoteDataSourceImp implements CategoryRemoteDataSource{
  ApiConsumer api;
  CategoryRemoteDataSourceImp({required this.api});
  @override
  Future<List<CategoryModel>?> getAllCategory() async {
    final  response=await api.get(EndPoints.allMealCategories);
    // print("ssssssssssssssss ${response.runtimeType}");
    // print("ssssssssssssssss ${response}");
      final baseResponse = CategoryBaseResponse.fromJson(response);

    return  baseResponse.categories ;
  }

  @override
  Future<List<CategoryModel>?> listAllCategory() async {
    final  response=await api.get(EndPoints.listAllCategories);
    // print("ssssssssssssssss ${response.runtimeType}");
    print("listAll ${response}");
    final baseResponse = CategoryBaseResponse.fromJson(response);
    return  baseResponse.meals ;
  }



}