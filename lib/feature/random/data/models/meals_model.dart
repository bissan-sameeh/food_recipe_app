// class MealModel {
//   final String idMeal;
//   final String strMeal;
//   final String? strMealAlternate;
//   final String strCategory;
//   final String strArea;
//   final String strInstructions;
//   final String strMealThumb;
//   final String? strTags;
//   final String? strYoutube;
//   final List<String> ingredients;
//   final List<String> measures;
//   final String? strSource;
//
//   MealModel({
//     required this.idMeal,
//     required this.strMeal,
//     this.strMealAlternate,
//     required this.strCategory,
//     required this.strArea,
//     required this.strInstructions,
//     required this.strMealThumb,
//     this.strTags,
//     this.strYoutube,
//     required this.ingredients,
//     required this.measures,
//     this.strSource,
//   });
//
//   factory MealModel.fromJson(Map<String, dynamic> json) {
//     // extract ingredients and measures dynamically
//     List<String> ingredients = [];
//     List<String> measures = [];
//
//     for (int i = 1; i <= 20; i++) {
//       final ingredient = json['strIngredient$i'];
//       final measure = json['strMeasure$i'];
//       if (ingredient != null &&
//           ingredient.toString().trim().isNotEmpty &&
//           ingredient != '') {
//         ingredients.add(ingredient);
//         measures.add(measure ?? '');
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
//       strTags: json['strTags'],
//       strYoutube: json['strYoutube'],
//       ingredients: ingredients,
//       measures: measures,
//       strSource: json['strSource'],
//     );
//   }
// }
