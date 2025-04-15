import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/elevated_btn.dart';

import '../../../../../core/styles/colors_manager.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/favorite_widget.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key,required this.strIngredient, required this.idIngredient});
  final String strIngredient;
  final String idIngredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:16.w ,vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: buildBorderRadiusDirectional,
          color: ColorsManager.white,
          border: Border.all(color:ColorsManager.white,width: 1) ,
          boxShadow:[ boxShadow()]
      ),
      child:  Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorsManager.grayLight100,
              borderRadius: BorderRadius.circular(25),
            ),
            child:Text(idIngredient,style: TextStyle(color: ColorsManager.black,fontSize: 18.sp),)
          ),
          SizedBox(width: 12.w,),
          Expanded(child: Text(strIngredient,style: Theme.of(context).textTheme.bodyMedium,)),
          //

          const ElevatedBtn(iconData: Icons.remove),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
            child: Text(
              '${0}',
              style: TextStyle(
                color: ColorsManager.black,
              ),
            ),
          ),
         const ElevatedBtn(iconData: Icons.add)




        ],
      ),
    );
  }
}
