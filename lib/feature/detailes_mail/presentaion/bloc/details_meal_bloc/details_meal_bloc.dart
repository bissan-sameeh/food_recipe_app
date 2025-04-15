import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/feature/detailes_mail/domain/use_cases/get_meals_details_use_case.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/meal_model/meal_model.dart';
import '../../../../search/presentaion/bloc/search_bloc/search_bloc.dart';

part 'details_meal_event.dart';
part 'details_meal_state.dart';

class DetailsMealBloc extends Bloc<DetailsMealEvent, DetailsMealState> {
  GetMealsDetailsUseCase getMealsDetailsUseCase;
  DetailsMealBloc({required this.getMealsDetailsUseCase}) : super(DetailMealInitial()) {
    on<DetailsMealEvent>((event, emit) async {
     if(event is GetMealsDetailsEvent){
       emit(DetailMealLoadingState());
       final eitherFailureOrMealDetails=await getMealsDetailsUseCase.call(mealId: event.mealId);
       emit(_mapFailureOrMealToState(eitherFailureOrMealDetails));
     }

    });
  }
}
DetailsMealState  _mapFailureOrMealToState(
    Either<Failure, List<MealModel>?> either) {
  return either.fold(
          (failure) =>  DetailMealFailedState(message: (failure.message)),
          (meals) => DetailMealSuccessState( meals: meals));
}
