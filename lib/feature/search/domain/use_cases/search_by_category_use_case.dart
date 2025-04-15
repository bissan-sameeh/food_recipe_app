


import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';

import '../../../../core/models/meal_model/meal_model.dart';
import '../repoistory/search_repository.dart';

class SearchByCategoryUseCase{
  final SearchRepository repository;

  SearchByCategoryUseCase({required this.repository});

  Future<Either<Failure, List<MealModel>?>> call({required String category}) async {
    return await repository.searchByCategory(category: category);
  }
}