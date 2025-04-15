
import 'package:dartz/dartz.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

import '../../../../core/error/failure.dart';

abstract class IngredientsRepository {
  Future<Either<Failure,List<MealIngredient>?>> getIngredients();
}