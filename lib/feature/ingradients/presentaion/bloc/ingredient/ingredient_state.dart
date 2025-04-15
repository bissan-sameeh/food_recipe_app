part of 'ingredient_bloc.dart';

abstract class IngredientState extends Equatable {
  const IngredientState();
  @override
  List<Object> get props => [];
}

final class IngredientInitial extends IngredientState {
}final class IngredientLoadingState extends IngredientState {
}final class IngredientSuccessState extends IngredientState {
  final List<MealIngredient> ingredients;
  const IngredientSuccessState({required this.ingredients});
}final class IngredientFailedState extends IngredientState {
  final String message;
  const IngredientFailedState({required this.message});
}


