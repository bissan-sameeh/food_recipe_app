import 'package:flutter/material.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/favorites_widget/favorite_item.dart';

import '../../../data/models/favorite_meal_model.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList(
      {super.key,
        required this.meals,
        this.widthContainer,
        this.heightContainer ,  });

  final List<FavoriteMealModel>? meals;
  final double? widthContainer;
  final double? heightContainer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: meals!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index)  {
            return FavoriteItem(
              mealModel: meals![index],
              heightContainer: heightContainer,
              widthContainer: widthContainer,
            );
          },
      
      
      ),
    );
  }
}
