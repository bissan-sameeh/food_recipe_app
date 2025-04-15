


import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';

import '../../../../core/models/meal_model/meal_model.dart';
import '../repoistory/search_repository.dart';

class SearchByAreaUseCase{
  final SearchRepository repository;

  SearchByAreaUseCase({required this.repository});

  Future<Either<Failure, List<MealModel>?>> call({required String areaName}) async {
    return await repository.searchByArea(areaName: areaName);
  }
}