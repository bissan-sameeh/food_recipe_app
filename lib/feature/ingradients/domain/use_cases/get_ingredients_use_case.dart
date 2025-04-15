


import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

import '../repoistory/ingredients_repository.dart';

class GetIngredientsUseCase{
 final IngredientsRepository repository;

 GetIngredientsUseCase({required this.repository});

 Future<Either<Failure, List<MealIngredient>?>> call() async {
  return await repository.getIngredients();
 }
}