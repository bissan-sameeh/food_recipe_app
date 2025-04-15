
class CategoryModel {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoryModel({
     this.idCategory,
     this.strCategory,
     this.strCategoryThumb,
     this.strCategoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['idCategory'] ,
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'] ,
      strCategoryDescription: json['strCategoryDescription'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategory': idCategory,
      'strCategory': strCategory,
      'strCategoryThumb': strCategoryThumb,
      'strCategoryDescription': strCategoryDescription,
    };
  }
}
