part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchByCategoryEvent extends SearchEvent {
  final String category;

  const SearchByCategoryEvent({required this.category});

  @override
  // TODO: implement props
  List<Object?> get props => [category];
}

class SearchByAreaEvent extends SearchEvent {
  final String area;

  const SearchByAreaEvent({required this.area});

  @override
  // TODO: implement props
  List<Object?> get props => [area];
}
