

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/meal_model/meal_model.dart';
abstract class SearchRepository {
  Future<Either<Failure,List<MealModel>?>> searchByCategory({required String category});
  Future<Either<Failure,List<MealModel>?>> searchByArea({required String areaName});
  // Future<Either<Failure,List<MealModel>?>> getAllMeals({required String areaName});

}