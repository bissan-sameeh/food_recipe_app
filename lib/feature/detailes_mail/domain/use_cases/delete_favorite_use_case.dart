import 'package:dartz/dartz.dart';
import 'package:food_recipe/feature/detailes_mail/domain/repoistory/details_meal_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/favorite_meal_model.dart';

class DeleteFavoriteUseCase{
  final DetailsMealRepository repository;
  DeleteFavoriteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required FavoriteMealModel meal}) async {
    return await repository.removeFromFavorite(meal);
  }
}