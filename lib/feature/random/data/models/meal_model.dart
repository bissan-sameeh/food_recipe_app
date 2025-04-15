//
// import '../../../../core/entity/meal_entity/meal_entity.dart';
//
// class MealModel extends Meal {
//   MealModel({
//     required String idMeal,
//     required String strMeal,
//     String? strMealAlternate,
//     required String strCategory,
//     required String strArea,
//     required String strInstructions,
//      super.strMealThumb,
//
//     String? strYoutube,
//     required super.imageUrl,
//     String? strSource,
//     required super.ingredients,
//     required super.measures,
//   }) : super(
//     id: idMeal,
//     name: strMeal,
//     alternate: strMealAlternate,
//     category: strCategory,
//     area: strArea,
//     instructions: strInstructions,
//     youtubeUrl: strYoutube,
//     source: strSource,
//   );
//
//   factory MealModel.fromJson(Map<String, dynamic> json) {
//     List<String> ingredients = [];
//     List<String> measures = [];
//
//     for (int i = 1; i <= 20; i++) {
//       final ingredient = json['strIngredient$i'];
//       final measure = json['strMeasure$i'];
//
//       if (ingredient != null &&
//           ingredient.toString().trim().isNotEmpty) {
//         ingredients.add(ingredient.toString().trim());
//         measures.add((measure ?? '').toString().trim());
//       }
//     }
//
//     return MealModel(
//       idMeal: json['idMeal'],
//       strMeal: json['strMeal'],
//       strMealAlternate: json['strMealAlternate'],
//       strCategory: json['strCategory'],
//       strArea: json['strArea'],
//       strInstructions: json['strInstructions'],
//       strMealThumb: json['strMealThumb'],
//       strYoutube: json['strYoutube'],
//       strSource: json['strSource'],
//       ingredients: ingredients,
//       measures: measures, imageUrl: json['imageUrl'],
//     );
//   }
//
//   // Meal toEntity() {
//   //   return Meal(
//   //     id: idMeal,
//   //     name: strMeal,
//   //     alternate: strMealAlternate,
//   //     category: strCategory,
//   //     area: strArea,
//   //     instructions: strInstructions,
//   //     imageUrl: strMealThumb,
//   //     youtubeUrl: strYoutube,
//   //     ingredients: ingredients,
//   //     measures: measures,
//   //     source: strSource, strMealThumb: str,
//   //   );
//   // }
// }
