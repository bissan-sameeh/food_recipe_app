

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/meal_model/meal_model.dart';
abstract class RandomRepository {
  Future<Either<Failure,List<MealModel>?>> getRandom();

}