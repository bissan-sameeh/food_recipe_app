part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {
}

class FavoriteLoadingState extends FavoriteState{

}class FavoriteSuccessState extends FavoriteState{

}class FavoriteFailedState extends FavoriteState{
  final String message;
  const FavoriteFailedState({required this.message});
}class FavoriteGetAllFavorites extends FavoriteState{
  final List<FavoriteMealModel> meals;
  const FavoriteGetAllFavorites({required this.meals});
}

class FavoriteChangedState extends FavoriteState {
  final Map<String, bool> favoriteMeals ;
  const FavoriteChangedState(this.favoriteMeals);

  @override
  List<Object> get props => [favoriteMeals];
}
