import 'package:flutter/material.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key, required this.strMeal});
  final String strMeal;

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> with TickerProviderStateMixin {
  bool isExpanded = false; // هل النص ممدود ولا لا
  bool isOverflowing = false; // هل النص طوله أكثر من سطرين ولا لا

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        // إذا النص طويل أكتر من سطرين
        final span = TextSpan(text: widget.strMeal, style: textStyle);
        final tp = TextPainter(
          text: span,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                widget.strMeal,
                style: textStyle,
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    isExpanded ? 'View Less' : 'View More',
                    style: TextStyle(
                      color: ColorsManager.darkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
