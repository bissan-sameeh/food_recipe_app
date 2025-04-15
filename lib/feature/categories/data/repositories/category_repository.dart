import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/constants/hive_constants.dart';
import 'package:food_recipe/core/error/exceptions.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/categories/data/data_sources/category_local_data_source.dart';
import 'package:food_recipe/feature/categories/data/data_sources/category_remote_data_source.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';
import 'package:food_recipe/feature/categories/domain/repoistory/category_repository.dart';
import 'package:hive/hive.dart';

import '../../../../core/network/network_info.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource categoryLocalDataSource;
  final NetworkInfo networkInfo;
  final Box box;

  // Hive.box(HiveConstants.categoryBox)
  CategoryRepositoryImp(
      {required this.remoteDataSource,
      required this.categoryLocalDataSource,
      required this.networkInfo,
      required this.box});

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory() async {
    if (await networkInfo.isConnected) {
      try {
      final response = await remoteDataSource.getAllCategory();

      return Right(response!);
      } on ServerException{
        return left(const ServerFailure());
      }
    }
    else{
      try{
      List<CategoryModel> categoryList = List.from(box.get(HiveConstants.categoryList, defaultValue: [])).cast<CategoryModel>();

      if (categoryList == []) {
        await categoryLocalDataSource.saveCategories(categoryList);
        final cachedData = await categoryLocalDataSource.getSavedCategories();
        return Right(cachedData);
      }
      } on EmptyCacheException{
        return left(const EmptyCacheFailure());
      }
      return left(const OfflineFailure());
    }
    }



  @override
  Future<Either<Failure, List<CategoryModel>>> listAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.listAllCategory();

        return Right(response!);
      } on ServerException{
        return left(const ServerFailure());
      }
    }
    else{
      return left(const OfflineFailure());
    }

}
}