
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/meal_model/meal_model.dart';
import '../repoistory/random_repository.dart';

class RandomUseCase{
  final RandomRepository repository;

  RandomUseCase({required this.repository});

  Future<Either<Failure, List<MealModel>?>> call() async {
    return await repository.getRandom();
  }
}