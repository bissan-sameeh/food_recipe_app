import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/feature/detailes_mail/domain/entity/details_entity.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/details_widget.dart';

class DetailsList extends StatelessWidget {
   const DetailsList({super.key, required this.details});

  final List<DetailsEntity> details;


  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16.h,childAspectRatio: 9.w/2.3.h), itemBuilder: (BuildContext context, int index) {
      return DetailsWidget(path: details[index].icon, description: details[index].description);
    },);
  }
}
