part of 'random_bloc.dart';

class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object> get props => [];
}

final class RandomInitial extends RandomState {
  @override
  List<Object> get props => [];
}

final class RandomSuccessState extends RandomState {
  final List<MealModel>? meals;

  const RandomSuccessState({required this.meals});
}

final class RandomFailedState extends RandomState {
  final String message;

  const RandomFailedState({required this.message});
}

final class RandomLoadingState extends RandomState {}
