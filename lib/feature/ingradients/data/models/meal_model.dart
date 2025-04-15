
class MealIngredient {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  MealIngredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
  });

  factory MealIngredient.fromJson(Map<String, dynamic> json) => MealIngredient(
    idIngredient: json["idIngredient"],
    strIngredient: json["strIngredient"],
    strDescription: json["strDescription"],
    strType: json["strType"],
  );

  Map<String, dynamic> toJson() => {
    "idIngredient": idIngredient,
    "strIngredient": strIngredient,
    "strDescription": strDescription,
    "strType": strType,
  };
}