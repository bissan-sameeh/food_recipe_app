import 'dart:convert';

import 'package:food_recipe/feature/ingradients/data/models/meal_model.dart';

MealIngredientBaseResponse mealIngredientBaseResponseFromJson(String str) => MealIngredientBaseResponse.fromJson(json.decode(str));

String mealIngredientBaseResponseToJson(MealIngredientBaseResponse data) => json.encode(data.toJson());

class MealIngredientBaseResponse {
  List<MealIngredient>? meals;

  MealIngredientBaseResponse({
    this.meals,
  });

  factory MealIngredientBaseResponse.fromJson(Map<String, dynamic> json) => MealIngredientBaseResponse(
    meals: json["meals"] == null ? [] : List<MealIngredient>.from(json["meals"]!.map((x) => MealIngredient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": meals == null ? [] : List<dynamic>.from(meals!.map((x) => x.toJson())),
  };
}