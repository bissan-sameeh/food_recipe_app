import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';
import 'package:food_recipe/feature/categories/domain/use_cases/get_all_categories.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../domain/use_cases/list_all_categories_use_case.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoriesUseCase getAllCategoriesCase;
  final ListAllCategoriesUseCase getListCategoriesCase;


  CategoryBloc({
    required this.getAllCategoriesCase,
    required this.getListCategoriesCase,
  }) : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>((event, emit) async {
      emit(CategoryLoadingState());
      final result = await getAllCategoriesCase.call();
      emit(_mapFailureOrCategoriesToState(result));
    });

    on<GetListCategoriesEvent>((event, emit) async {
      emit(CategoryLoadingState());
      final result = await getListCategoriesCase.call();
      emit(_mapFailureOrCategoriesToState(result));
    });
  }
    //   if (event is GetAllCategoriesEvent ) {
    //     emit(CategoryLoadingState());
    //     final failureOrCategoriesList = await getAllCategoriesCase.call();
    //     emit(_mapFailureOrCategoriesToState(failureOrCategoriesList));
    //   }else if(event is GetListCategoriesEvent){
    //     emit(CategoryLoadingState());
    //     final failureOrCategoriesList=await getListCategoriesCase.call();
    //     emit(_mapFailureOrCategoriesToState(failureOrCategoriesList));
    //   }
    // }



  }

  CategoryState _mapFailureOrCategoriesToState(
      Either<Failure, List<CategoryModel>> either) {
    return either.fold(
        (failure) => CategoryFailedState(message: failure.message),
        (categories) => (CategorySuccessState(categories: categories)));
  }

