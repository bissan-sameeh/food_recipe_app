import 'package:dartz/dartz.dart';
import 'package:food_recipe/feature/detailes_mail/domain/repoistory/details_meal_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/favorite_meal_model.dart';

class AddToFavorites{
  final DetailsMealRepository repository;
  AddToFavorites({required this.repository});

  Future<Either<Failure, bool>> call({required String favorite}) async {
    return await repository.isFavorite(favorite);
  }
}