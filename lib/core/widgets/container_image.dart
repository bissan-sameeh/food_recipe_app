import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';

import '../styles/colors_manager.dart';
import '../styles/styles.dart';

class ContainerImage extends StatelessWidget with ImageHelper{
  const ContainerImage({super.key, required this.imagePath, this.heightContainer, this.widthContainer=double.infinity, this.bottomMargin});
  final String imagePath;
  final double? heightContainer;
  final double? widthContainer;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: heightContainer != null ? heightContainer!.h : null,
        width: widthContainer?.w,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(bottom:bottomMargin!=null ? 12.h :0),
        decoration: BoxDecoration(
          color: ColorsManager.grayLight100,
          borderRadius:
          buildBorderRadiusDirectional,
        ),
        child: fancyShimmer(
          imagePath: imagePath,
          width: widthContainer!.w,
          height: heightContainer!.h,
        ));
  }
}
