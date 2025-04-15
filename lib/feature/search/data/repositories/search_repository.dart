import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/error/exceptions.dart';
import 'package:food_recipe/core/error/failure.dart';

import '../../../../core/models/meal_model/meal_model.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repoistory/search_repository.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImp({required this.searchRemoteDataSource,

      required this.networkInfo,
     });

  @override
  Future<Either<Failure, List<MealModel>?>> searchByArea({required String areaName}) async {

    return await _mapFunction(
      categoryOrAreaFunction: () {
        return     searchRemoteDataSource.searchByArea(areaName: areaName);

      },
    );
  //      if (await networkInfo.isConnected) {
  //       try {
  //       final response = await searchRemoteDataSource.searchByArea(areaName: areaName);
  //
  //       return Right(response);
  //       } on ServerException{
  //         return left(const ServerFailure());
  //       }
  //     }
  //      else{
  //       return left(const OfflineFailure());
  //
  // }
  }

  @override
  Future<Either<Failure, List<MealModel>?>> searchByCategory({required String category}) async {

  return await _mapFunction(
    categoryOrAreaFunction: () {
      return     searchRemoteDataSource.searchByCategory(category: category);

    },
  );
    // if (await networkInfo.isConnected) {
    //   try {
    //     final response = await searchRemoteDataSource.searchByArea(areaName: category);
    //
    //     return Right(response);
    //   } on ServerException{
    //     return left(const ServerFailure());
    //   }
    // }
    // else{
    //   return left(const OfflineFailure());
    //
    // }
  }


  Future<Either<Failure, List<MealModel>?>> _mapFunction({
  required Future<List<MealModel>?> Function( ) categoryOrAreaFunction
}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await categoryOrAreaFunction();
       print("resonse repo:$response");
        return right(response);
      } on ServerException{
        return left(const ServerFailure());
      }
    }
    else{
      return left(const OfflineFailure());

    }
  }

}