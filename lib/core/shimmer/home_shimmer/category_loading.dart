import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,

      itemBuilder:  (context, index) {

            return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade50, child:
            Container(
              height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 9.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(40.r),

                )
            ));
      } //
      ,
      separatorBuilder: (context, index) => SizedBox(
      height: 12.w,
      ),
      itemCount: 8,

      ),
    );
  }
}
