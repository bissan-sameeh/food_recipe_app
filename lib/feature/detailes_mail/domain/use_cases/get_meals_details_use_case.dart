


import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/detailes_mail/domain/repoistory/details_meal_repository.dart';

import '../../../../core/models/meal_model/meal_model.dart';
import '../repoistory/search_repository.dart';

class GetMealsDetailsUseCase{
  final DetailsMealRepository repository;

  GetMealsDetailsUseCase({required this.repository});

  Future<Either<Failure, List<MealModel>?>> call({required String mealId}) async {
    return await repository.getMealDetails( mealId: mealId);
  }
}