
import 'package:dartz/dartz.dart';
import 'package:food_recipe/feature/random/data/data_sources/random_remote_data_source.dart';
import 'package:food_recipe/feature/random/domain/repoistory/random_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/meal_model/meal_model.dart';
import '../../../../core/network/network_info.dart';

class RandomRepositoryImp implements RandomRepository {
  final RandomRemoteDataSource randomRemoteDataSource;
  final NetworkInfo networkInfo;

  RandomRepositoryImp({required this.randomRemoteDataSource,

    required this.networkInfo,
  });



  @override
  Future<Either<Failure, List<MealModel>?>> getRandom() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await randomRemoteDataSource.getRandom();

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