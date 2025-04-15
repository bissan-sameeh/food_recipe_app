import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/constants/hive_constants.dart';
import 'package:food_recipe/feature/detailes_mail/data/models/favorite_meal_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';

abstract class FavoriteLocalDataSource{
  Future<Unit> addToFavorites(FavoriteMealModel meal);
  Future<Unit> removeFromFavorite(FavoriteMealModel meal);
  Future<List<FavoriteMealModel>> getFavorites();
  Future<bool> isFavorite(String id);

}

class FavoriteLocalDataSourceImp implements FavoriteLocalDataSource{
  final Box box;
  FavoriteLocalDataSourceImp({required this.box});
  @override
  Future<Unit> addToFavorites(FavoriteMealModel meal) async {
    try {
      List<FavoriteMealModel> list=_getList();
      list.add(meal);

      await box.put(HiveConstants.favoriteList, list);
      return Future.value(unit);
    } catch (e) {
      throw CacheException();
    }
  }
  List<FavoriteMealModel>  _getList(){
    return List.from(box.get(HiveConstants.favoriteList,defaultValue: []),).cast<FavoriteMealModel>();
  }

  @override
  Future<List<FavoriteMealModel>> getFavorites() async {
    try {

      return _getList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> isFavorite(String id) async {
    try {
      List<FavoriteMealModel> list=_getList();
      bool isContain = list.any((meal) => meal.id == id);
      return isContain;
    } catch (e) {
      throw CacheException();
    }  }

  @override
  Future<Unit> removeFromFavorite(FavoriteMealModel meal) async {
    try {
      List<FavoriteMealModel> list = _getList();
      list.removeWhere((element) => element.id == meal.id);
      await box.put(HiveConstants.favoriteList, list);
      return Future.value(unit);
    } catch (e) {
      throw CacheException();
    }
  }

}