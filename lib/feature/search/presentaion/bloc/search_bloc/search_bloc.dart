import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/feature/search/domain/use_cases/search_by_area_use_case.dart';
import 'package:food_recipe/feature/search/domain/use_cases/search_by_category_use_case.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/models/meal_model/meal_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
    SearchByCategoryUseCase searchByCategoryUseCase;
    SearchByAreaUseCase searchByAreaUseCase;
  SearchBloc({required this.searchByAreaUseCase,required this.searchByCategoryUseCase}) : super(SearchInitial()) {

    on<SearchEvent>((event, emit) async {
    if(event is SearchByCategoryEvent){
      emit(SearchLoadingState());
      final mealsList=await searchByCategoryUseCase.call(category: event.category);
      print("meals list ${right(mealsList)}");
      emit( _mapFailureOrMealsToState(mealsList));
    }else if(event is SearchByAreaEvent){
      emit(SearchLoadingState());
      final mealsOfList=await searchByAreaUseCase.call(areaName: event.area);
      print("meals list ${right(mealsOfList)}");
      emit( _mapFailureOrMealsToState(mealsOfList));
    }
    });


}
    SearchState  _mapFailureOrMealsToState(
        Either<Failure, List<MealModel>?> either) {
      return either.fold(
              (failure) => SearchFailedState(message: (failure.message)),
              (meals) => (SearchSuccessState( meals: meals)));
    }


}
