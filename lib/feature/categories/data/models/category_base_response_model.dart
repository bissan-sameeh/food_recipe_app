import 'category_model.dart';

class CategoryBaseResponse {
  final List<CategoryModel>? categories;
  final List<CategoryModel>? meals;

  CategoryBaseResponse({this.meals, required this.categories});

  factory CategoryBaseResponse.fromJson(Map<String, dynamic> json) {
    var categoriesList = json['categories'] as List?;
    List<CategoryModel> categoryList = categoriesList == null
        ? []
        : categoriesList.map((e) => CategoryModel.fromJson(e)).toList();

    var mealsList = json['meals'] as List?;
    List<CategoryModel> mealList = mealsList == null
        ? []
        : mealsList.map((e) => CategoryModel.fromJson(e)).toList();

    return CategoryBaseResponse(
      categories: categoryList,
      meals: mealList,
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories?.map((e) => e.toJson()).toList() ?? [],
      'meals': meals?.map((e) => e.toJson()).toList() ?? [],
    };
  }
}
