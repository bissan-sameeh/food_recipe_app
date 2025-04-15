import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/entity/meal_entity/meal_entity.dart';
import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../categories/domain/use_cases/get_all_categories.dart';
import '../../../domain/use_cases/get_ingredients_use_case.dart';

part 'ingredient_event.dart';
part 'ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
    final GetIngredientsUseCase getIngredientsUseCase;
  IngredientBloc({required this.getIngredientsUseCase}) : super(IngredientInitial()) {
    on<IngredientEvent>((event, emit) async {
      if(event is GetIngredientEvent) {
        emit(IngredientLoadingState());
        final failureOrIngredients = await getIngredientsUseCase.call();
        emit(_mapFailureOIngredientToState(failureOrIngredients));
      }  });
  }

}
IngredientState _mapFailureOIngredientToState(
      Either<Failure, List<MealIngredient>?> either) {
    return either.fold(
            (failure) => IngredientFailedState(message: failure.message),
            (ingredients) => IngredientSuccessState( ingredients: ingredients!));
  }

