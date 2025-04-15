part of 'ingredient_reader_cubit.dart';

abstract class IngredientReaderState extends Equatable {
  const IngredientReaderState();
  @override
  List<Object> get props => [];
}

final class IngredientReaderInitial extends IngredientReaderState {
}final class ChangeIngredientReaderState extends IngredientReaderState {
  final Recipe recipe;

  const ChangeIngredientReaderState(this.recipe);

  @override
  List<Object> get props => [recipe];
}
