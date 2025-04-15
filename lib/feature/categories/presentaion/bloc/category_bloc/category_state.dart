part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {
}
final class CategorySuccessState extends CategoryState {
  final List<CategoryModel> categories;
  const CategorySuccessState({required this.categories});
  @override
  List<Object> get props => [categories];
}
final class CategoryFailedState extends CategoryState {
  final String message;
  const CategoryFailedState({required this.message});
}

final class CategoryLoadingState extends CategoryState {
}
