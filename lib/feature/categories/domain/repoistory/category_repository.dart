import 'package:food_recipe/feature/categories/data/models/category_model.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
abstract class CategoryRepository {
  Future<Either<Failure,List<CategoryModel>>> getAllCategory();
  Future<Either<Failure,List<CategoryModel>>> listAllCategories();

}