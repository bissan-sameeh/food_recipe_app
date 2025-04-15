import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors_manager.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/container_image.dart';
import '../../../../../core/widgets/btn_widget.dart';

class EditorItem extends StatelessWidget {
  const EditorItem({super.key, required this.imagePath, required this.strMeal});
  final String imagePath;
  final String strMeal;

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
          ContainerImage(
            imagePath: imagePath,
            widthContainer: 100,
            heightContainer: 84,
          ),
          SizedBox(width: 12.w,),
          Expanded(child: Text(strMeal,style: Theme.of(context).textTheme.bodyMedium,)),
          //
          BtnWidget(
            backgroundColor: ColorsManager.black,
            iconColor: ColorsManager.white,
            path: 'arrow',
          ),



        ],
      ),
    );
  }
}
