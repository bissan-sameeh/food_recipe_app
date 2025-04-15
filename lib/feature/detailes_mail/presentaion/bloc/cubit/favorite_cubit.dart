import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/models/meal_model/meal_model.dart';
import 'package:food_recipe/feature/detailes_mail/data/models/favorite_meal_model.dart';
import 'package:food_recipe/feature/detailes_mail/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:food_recipe/feature/detailes_mail/domain/use_cases/delete_favorite_use_case.dart';
import 'package:food_recipe/feature/detailes_mail/domain/use_cases/get_favorites_use_case.dart';
import 'package:food_recipe/feature/detailes_mail/domain/use_cases/is_favorites_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;
  final IsFavoritesUseCase isFavoritesUseCase;


  FavoriteCubit(
      {required this.addToFavoritesUseCase, required this.getFavoritesUseCase, required this.deleteFavoriteUseCase, required this.isFavoritesUseCase}) : super(FavoriteInitial());

  final Map<String, bool> favoriteMeals = {};
  void toggleFavorite(MealModel meal) async {

   // emit(FavoriteLoadingState());
    final result= await isFavoritesUseCase.call(favorite: meal.id);
    result.fold((failure) {
      emit(FavoriteFailedState(message: failure.message));

    },
          (isFav) async {
    if(isFav==true){
      await deleteFavoriteUseCase.call(meal: FavoriteMealModel(id: meal.id, strMeal: meal.strMeal, strMealThumb: meal.strMealThumb!));
      favoriteMeals[meal.id] = false;
    }else{
      await addToFavoritesUseCase.call(meal: FavoriteMealModel(id: meal.id, strMeal: meal.strMeal, strMealThumb: meal.strMealThumb!));
      favoriteMeals[meal.id] = true;

    }
    emit(FavoriteChangedState({...favoriteMeals}));

    emit(FavoriteSuccessState());
     loadFavorites();

          },);

  }

  void loadFavorites() async{
    // emit(FavoriteLoadingState());
    final successOrFailure =await getFavoritesUseCase();
    successOrFailure.fold((l) {

    emit(FavoriteFailedState(message: l.message));
    }, (favorites) {

      favoriteMeals.clear();
      for (var meal in favorites) {
        favoriteMeals[meal.id] = true;
      }

      emit(FavoriteGetAllFavorites(meals: favorites));

    },);
  }

  void checkIfFavorite(String mealId) async {
    final result = await isFavoritesUseCase.call(favorite: mealId);
    result.fold(
          (failure) => emit(FavoriteFailedState(message: failure.message)),
          (isFav){
            favoriteMeals[mealId] = isFav;
            emit(FavoriteChangedState({...favoriteMeals}));
          },
    );
  }
}
