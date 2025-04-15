import 'package:dio/dio.dart';
import 'package:food_recipe/core/constants/hive_constants.dart';
import 'package:food_recipe/core/network/network_info.dart';
import 'package:food_recipe/feature/categories/data/data_sources/category_remote_data_source.dart';
import 'package:food_recipe/feature/categories/data/repositories/category_repository.dart';
import 'package:food_recipe/feature/categories/domain/repoistory/category_repository.dart';
import 'package:food_recipe/feature/categories/domain/use_cases/get_all_categories.dart';
import 'package:food_recipe/feature/categories/domain/use_cases/list_all_categories_use_case.dart';
import 'package:food_recipe/feature/categories/presentaion/bloc/category_bloc/category_bloc.dart';
import 'package:food_recipe/feature/detailes_mail/data/data_sources/details_meals_remote_data_source.dart';
import 'package:food_recipe/feature/detailes_mail/domain/repoistory/details_meal_repository.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/bloc/details_meal_bloc/details_meal_bloc.dart';
import 'package:food_recipe/feature/ingradients/data/data_sources/ingredients_remote_data_source.dart';
import 'package:food_recipe/feature/ingradients/data/repositories/ingredient_repository.dart';
import 'package:food_recipe/feature/ingradients/domain/repoistory/ingredients_repository.dart';
import 'package:food_recipe/feature/ingradients/domain/use_cases/get_ingredients_use_case.dart';
import 'package:food_recipe/feature/ingradients/presentaion/bloc/ingredient/ingredient_bloc.dart';
import 'package:food_recipe/feature/random/data/repositories/random_reposirory.dart';
import 'package:food_recipe/feature/random/domain/repoistory/random_repository.dart';
import 'package:food_recipe/feature/random/domain/use_cases/random_use_case.dart';
import 'package:food_recipe/feature/random/presentaion/bloc/random_bloc.dart';
import 'package:food_recipe/feature/search/data/repositories/search_repository.dart';
import 'package:food_recipe/feature/search/domain/repoistory/search_repository.dart';
import 'package:food_recipe/feature/search/domain/use_cases/search_by_area_use_case.dart';
import 'package:food_recipe/feature/search/domain/use_cases/search_by_category_use_case.dart';
import 'package:food_recipe/feature/search/presentaion/bloc/search_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/api_helper/api_consumer.dart';
import 'core/api_helper/dio_consumer.dart';
import 'feature/categories/data/data_sources/category_local_data_source.dart';
import 'feature/detailes_mail/data/repositories/details_meal_repository.dart';
import 'feature/detailes_mail/domain/use_cases/get_meals_details_use_case.dart';
import 'feature/ingradients/presentaion/cubit/ingredient_reader/ingredient_reader_cubit.dart';
import 'feature/random/data/data_sources/random_remote_data_source.dart';
import 'feature/search/data/data_sources/search_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {


  // bloc
  sl.registerFactory(() => CategoryBloc(getAllCategoriesCase: sl.call(), getListCategoriesCase: sl.call()));
  sl.registerFactory(() => SearchBloc(searchByCategoryUseCase: sl.call(), searchByAreaUseCase: sl.call()));
  sl.registerFactory(() => RandomBloc(randomUseCase: sl.call(), randomUseCase2: sl.call(), randomUseCase3: sl.call()));
  sl.registerFactory(() => DetailsMealBloc(getMealsDetailsUseCase: sl.call()));
  sl.registerFactory(() => IngredientBloc(getAllCategoriesUseCase: sl.call()));
  sl.registerFactory(() => IngredientReaderCubit());

  // use case
  sl.registerLazySingleton(() => GetAllCategoriesUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ListAllCategoriesUseCase(repository: sl.call()),);
  sl.registerLazySingleton(() => SearchByAreaUseCase(repository: sl.call()),);
  sl.registerLazySingleton(() => SearchByCategoryUseCase(repository: sl.call()),);
  sl.registerLazySingleton(() => RandomUseCase(repository: sl.call()),);
  sl.registerLazySingleton(() => GetMealsDetailsUseCase(repository: sl.call()),);
  sl.registerLazySingleton(() => GetIngredientsUseCase(repository: sl.call()),);
  // repository

  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImp(
    remoteDataSource: sl.call(),
    categoryLocalDataSource: sl.call(),
    networkInfo: sl.call(),
    box: sl.call(),
  ));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImp(searchRemoteDataSource: sl.call(), networkInfo: sl.call()));
  sl.registerLazySingleton<RandomRepository>(() => RandomRepositoryImp(randomRemoteDataSource: sl.call(), networkInfo: sl.call() ));
  sl.registerLazySingleton<DetailsMealRepository>(() => DetailsMealRepositoryImp(detailsMealRepository: sl.call(), networkInfo: sl.call(), favoriteLocalDataSource: sl.call() ));
  sl.registerLazySingleton<IngredientsRepository>(() => IngredientsRepositoryImp(remoteDataSource: sl.call(), networkInfo: sl.call() ));
  // data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
          () => CategoryRemoteDataSourceImp(api: sl.call()));
  sl.registerLazySingleton<CategoryLocalDataSource>(
          () => CategoryLocalDataSourceImp(box: sl.call()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
          () => SearchRemoteDataSourceImp(api: sl.call()));
  sl.registerLazySingleton<RandomRemoteDataSource>(
          () => RandomRemoteDataSourceImp(api: sl.call()));
  sl.registerLazySingleton<DetailsMealsRemoteDataSource>(
          () => DetailsMealsRemoteDataSourceImp(api: sl.call()));
  sl.registerLazySingleton<IngredientsRemoteDataSource>(
          () => IngredientsRemoteDataSourceImp(api: sl.call()));
  // cores
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl.call()));

  final categoryBox = await Hive.openBox(HiveConstants.categoryBox);
  sl.registerLazySingleton(() => categoryBox);
  // external
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));





}
