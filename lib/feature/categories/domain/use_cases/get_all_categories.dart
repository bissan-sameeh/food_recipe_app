


import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';

import '../repoistory/category_repository.dart';

class GetAllCategoriesUseCase{
 final CategoryRepository repository;

 GetAllCategoriesUseCase({required this.repository});

 Future<Either<Failure, List<CategoryModel>>> call() async {
  return await repository.getAllCategory();
 }
}