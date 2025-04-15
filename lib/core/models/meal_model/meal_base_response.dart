
import 'dart:convert';

import 'meal_model.dart';



MealBaseResponse mealBaseResponseFromJson(String str) => MealBaseResponse.fromJson(json.decode(str));

// String mealBaseResponseToJson(MealBaseResponse data) => json.encode(data.toJson());

class MealBaseResponse {
  List<MealModel>? meals;

  MealBaseResponse({
    this.meals,
  });

  factory MealBaseResponse.fromJson(Map<String, dynamic> json) => MealBaseResponse(
    meals: json["meals"] == null ? [] : List<MealModel>.from(json["meals"]!.map((x) => MealModel.fromJson(x))),
  );

}