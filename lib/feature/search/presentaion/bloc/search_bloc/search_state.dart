part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchSuccessState extends SearchState {
  final List<MealModel>? meals;
  const SearchSuccessState({required this.meals});
}
final class SearchLoadingState extends SearchState {}
final class SearchFailedState extends SearchState {
  final String message;

  const SearchFailedState({required this.message});
}
