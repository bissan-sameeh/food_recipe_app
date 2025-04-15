part of 'details_meal_bloc.dart';

abstract class DetailsMealEvent extends Equatable {
  const DetailsMealEvent();
  @override
  List<Object> get props => [];

}


class GetMealsDetailsEvent extends DetailsMealEvent{
 final String mealId;
 const GetMealsDetailsEvent({required this.mealId});

}