import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/feature/random/domain/use_cases/random_use_case.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/meal_model/meal_model.dart';
import '../../../categories/data/models/category_model.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  final RandomUseCase randomUseCase;
  final RandomUseCase randomUseCase2;
  final RandomUseCase randomUseCase3;
  RandomBloc({required this.randomUseCase2, required this.randomUseCase3, required this.randomUseCase}) : super(RandomInitial()) {
    on<RandomEvent>((event, emit) async {


      emit(RandomLoadingState());
      final result1 = await randomUseCase.call();
      final result2 = await randomUseCase2.call();
      final result3 = await randomUseCase3.call();

      final allMeals = <MealModel>[];

      result1.fold(
              (failure) => emit(RandomFailedState(message: (failure.message))),
            (meals) => allMeals.addAll(meals ?? []),
      ); result2.fold(
              (failure) => emit(RandomFailedState(message: (failure.message))),
            (meals) => allMeals.addAll(meals ?? []),

      ); result3.fold(
              (failure) =>emit( RandomFailedState(message: (failure.message))),
            (meals) => allMeals.addAll(meals ?? []),
      );

      emit(RandomSuccessState(meals: allMeals));




    });
  }
}




