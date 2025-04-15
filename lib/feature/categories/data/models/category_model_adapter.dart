import 'package:food_recipe/feature/categories/data/models/category_model.dart';
import 'package:hive/hive.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel>{
  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
      idCategory: reader.readString(),
      strCategory: reader.readString(),
      strCategoryThumb: reader.readString(),
      strCategoryDescription: reader.readString(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeString(obj.idCategory ?? '');
    writer.writeString(obj.strCategory ?? '');
    writer.writeString(obj.strCategoryThumb ?? '');
    writer.writeString(obj.strCategoryDescription ?? '');  }

}