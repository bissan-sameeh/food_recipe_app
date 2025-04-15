import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/consants.dart';

part 'ingredient_reader_state.dart';

class IngredientReaderCubit extends Cubit<IngredientReaderState> {
  IngredientReaderCubit() : super(IngredientReaderInitial());
  Recipe recipe =Recipe.Ingredient;

  void updateRecipe(Recipe recipe){
    this.recipe=recipe;
    emit(ChangeIngredientReaderState(recipe));
  }

}







