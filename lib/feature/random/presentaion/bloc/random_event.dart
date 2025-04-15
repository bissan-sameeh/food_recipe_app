part of 'random_bloc.dart';

abstract class RandomEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const RandomEvent();

}




abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}



class GetRandomEvent extends RandomEvent{
}
