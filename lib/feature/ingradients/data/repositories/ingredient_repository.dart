
import 'package:dartz/dartz.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repoistory/ingredients_repository.dart';
import '../data_sources/ingredients_remote_data_source.dart';

class IngredientsRepositoryImp implements IngredientsRepository {
  final IngredientsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  IngredientsRepositoryImp(
      {required this.remoteDataSource,
      required this.networkInfo,});





  @override
  Future<Either<Failure,List<MealIngredient>?>> getIngredients() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getIngredient();

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