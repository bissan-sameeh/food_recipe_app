import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/widgets/custom_list_tile.dart';

import '../../../../core/styles/colors_manager.dart';
import '../../../auth/presentaion/widgets/custom_icon_text.dart';
import '../../../random/presentaion/widgets/recipe/recipe_widget.dart';
import '../widgets/home_widgets/category/category_items.dart';
import '../widgets/home_widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget with ImageHelper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        child: ListView(
          children: [
            //Welcome
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconText(
                      path: 'sun_icon',
                      text: 'Good Morning',
                      width: 20,
                      height: 20,
                      fontSize: 18,
                      textColor: ColorsManager.secondaryLightColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Madelyn Dias",
                      style: TextStyle(
                          color: ColorsManager.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                appSvgImage(path: 'cart', height: 18, width: 18)
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            // //featured
            const CustomListTile(leading: 'Featured'),
            // //Slider
            SizedBox(
              height: 12.h,
            ),
            SliderWidget(
              pageController: PageController(),
            ),
            SizedBox(
              height: 24.h,
            ),
            //Category
             const CategoryItems(),

              const RecipeWidget(heightSizedBox: 220,),
          ],
        ),
      ),
    );
  }
}
