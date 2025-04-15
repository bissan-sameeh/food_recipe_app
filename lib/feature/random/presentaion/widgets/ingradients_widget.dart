import 'package:flutter/material.dart';

import 'circle_seprator.dart';
import 'icon_text_item.dart';

class IngradientWidget extends StatelessWidget {
  const IngradientWidget({super.key, required this.strMeasure1, required this.strIngredient1});
  final String strMeasure1;
  final String strIngredient1;
  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Expanded(child: IconTextItem(iconPath: 'calories', text: strMeasure1,)),
        const CircleSeprator(),
        Expanded(child: IconTextItem(iconPath: 'calories', text: strIngredient1,)),

      ],
    );

  }
}
