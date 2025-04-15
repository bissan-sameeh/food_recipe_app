

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/meal_model/meal_model.dart';
import '../../data/models/favorite_meal_model.dart';
abstract class DetailsMealRepository {
  Future<Either<Failure,List<MealModel>?>> getMealDetails({required String mealId});
  Future<Either<Failure,Unit>> addToFavorites({required FavoriteMealModel meal});
  Future<Either<Failure,Unit>> removeFromFavorite(FavoriteMealModel meal);
  Future<Either<Failure,List<FavoriteMealModel>>> getFavorites();
  Future<Either<Failure,bool>> isFavorite(String id);

}