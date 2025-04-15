
import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/detailes_mail/data/data_sources/details_local_data_scource.dart';
import 'package:food_recipe/feature/detailes_mail/data/models/favorite_meal_model.dart';
import 'package:food_recipe/feature/detailes_mail/domain/repoistory/details_meal_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/details_meals_remote_data_source.dart';

class DetailsMealRepositoryImp implements DetailsMealRepository {
  final DetailsMealsRemoteDataSource detailsMealRepository;
  final FavoriteLocalDataSource favoriteLocalDataSource;
  final NetworkInfo networkInfo;

  DetailsMealRepositoryImp({required this.favoriteLocalDataSource, required this.detailsMealRepository,required this.networkInfo,});

  @override
  Future<Either<Failure, List<MealModel>?>> getMealDetails({required String mealId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await detailsMealRepository.getMealsDetails(mealId: mealId);
        final mealsWithFavorites = await _markFavoriteMeals(response!);
        return right(mealsWithFavorites);
      } on ServerException {
        return left(const ServerFailure());
      }
    } else {
      return left(const OfflineFailure());
    }
  }
  Future<List<MealModel>> _markFavoriteMeals(List<MealModel>? meals) async {
    final favoriteMeals = await favoriteLocalDataSource.getFavorites();
    final favoriteIds = favoriteMeals.map((meal) => meal.id).toSet();

    for (var meal in meals!) {
      if (favoriteIds.contains(meal.id)) {
        meal.isFavorite = true;
      }
    }

    return meals;
  }


  @override
  Future<Either<Failure, Unit>> addToFavorites({required FavoriteMealModel meal}) async {
    try {
      final model = FavoriteMealModel(id: meal.id, name: meal.name, image: meal.image);
      await favoriteLocalDataSource.addToFavorites(model);
      return right(unit);
    } on CacheException {
      return left( const CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteMealModel>>> getFavorites() async {
    try {
      final model = await favoriteLocalDataSource.getFavorites();
      return right(model);
    } on CacheException {
      return left(const CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String id) async {
    try {
      bool isFav=await favoriteLocalDataSource.isFavorite(id);
return right(isFav);
    } on CacheException {
      return left(const CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorite(FavoriteMealModel meal) async {
    try {
      await favoriteLocalDataSource.removeFromFavorite(meal);
      return const Right(unit);
    } on CacheException {
      return left(const CacheFailure());
    }
  }

}





