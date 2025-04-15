import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/categories/data/models/category_model.dart';

import '../../../../../../core/models/meal_model/meal_model.dart';
import '../../../../../../core/routers/router.dart';
import 'custom_category.dart';

class SuccessCategoryList extends StatelessWidget {
  const SuccessCategoryList({super.key,  this.categoryModel, this.mealModel});
  final List<CategoryModel>? categoryModel;
  final List<MealModel>? mealModel;

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 70.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          itemBuilder: (context, index) {
           final mealId=mealModel != null ?mealModel![index].id :'0';
            return  CustomCategory(
              onTap: () => NavigationRoutes().jump(context, Routes.detailsMeal,arguments: {
              'mealId':mealId,
              },),
              categoryModel: categoryModel!=null ? categoryModel![index] :null,
              mealModel: mealModel!= null ? mealModel![index] : null
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 12.w,),
          itemCount:categoryModel !=null ?  categoryModel!.length : mealModel!.length),
    );

  }
}
