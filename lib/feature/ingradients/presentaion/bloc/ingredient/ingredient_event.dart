part of 'ingredient_bloc.dart';

abstract class IngredientEvent extends Equatable {
  const IngredientEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetIngredientEvent extends IngredientEvent {
  const GetIngredientEvent();



}
