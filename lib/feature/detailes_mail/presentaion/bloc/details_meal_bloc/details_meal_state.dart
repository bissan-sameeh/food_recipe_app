part of 'details_meal_bloc.dart';

abstract class DetailsMealState extends Equatable {
  const DetailsMealState();
  @override
  List<Object> get props => [];
}

final class DetailsMealInitial extends DetailsMealState {
}





final class DetailMealInitial extends DetailsMealState {}
final class DetailMealSuccessState extends DetailsMealState {
  final List<MealModel>? meals;
  const DetailMealSuccessState({required this.meals});
}
final class DetailMealLoadingState extends DetailsMealState {}
final class DetailMealFailedState extends DetailsMealState {
  final String message;

  const DetailMealFailedState({required this.message});
}
