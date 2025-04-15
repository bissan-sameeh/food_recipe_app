import 'package:hive/hive.dart';

import 'favorite_meal_model.dart';

class FavoriteMealModelAdapter extends TypeAdapter<FavoriteMealModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteMealModel read(BinaryReader reader) {
    return FavoriteMealModel(
      id: reader.readString(),
      strMeal: reader.readString(),
      strMealThumb: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteMealModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.strMeal);
    writer.writeString(obj.strMealThumb);
  }
}
