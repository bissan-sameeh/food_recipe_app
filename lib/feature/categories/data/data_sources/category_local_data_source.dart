import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/constants/hive_constants.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
abstract class CategoryLocalDataSource{
  Future<Unit> saveCategories(List<CategoryModel> category);
  Future<List<CategoryModel>> getSavedCategories();
}
class CategoryLocalDataSourceImp implements CategoryLocalDataSource{
   final Box box;

  CategoryLocalDataSourceImp({required this.box});



  @override
  Future<List<CategoryModel>> getSavedCategories() async {
    try {
      List<CategoryModel> categoryToModel = initList(); //لو مش مكرييتين يعني اول مرة نفتح هيرجع null واجنا بدناش هيك ! , تاني مشكلة في الرن تايم هيكون List<dynamic < ,هيكون انه انه نت سب تايب اوف ورد مودل فبنعمله كاست >
    return categoryToModel;
    }catch(e) {
      throw EmptyCacheException();

  }}

  List<CategoryModel> initList() => List.from(box.get(HiveConstants.categoryList, defaultValue: [])).cast<CategoryModel>();

  @override
  Future<Unit> saveCategories(List<CategoryModel> categories) async {
    List<CategoryModel> categoriesList=initList();
    categoriesList.addAll(categories);
      await box.put(HiveConstants.categoryList, categoriesList);
      return Future.value(unit);
    }
}

