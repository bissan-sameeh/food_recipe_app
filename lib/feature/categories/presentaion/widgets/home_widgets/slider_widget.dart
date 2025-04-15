import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';

import '../../bloc/category_bloc/category_bloc.dart';

class SliderWidget extends StatelessWidget with ImageHelper {
  const SliderWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child:BlocBuilder<CategoryBloc, CategoryState>(

            builder: (context, state) {
              if (state is CategorySuccessState) {
               return PageView.builder(

                   scrollDirection: Axis.horizontal,
                   padEnds: false,

                   controller: PageController(viewportFraction: 0.8),
                   physics: const BouncingScrollPhysics(),

                   itemBuilder: (context, index) {
                 return Container(
                   width: 200.w,
                   margin: EdgeInsets.only(right: 12.w),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadiusDirectional.circular(16.r),
                       color: Theme
                           .of(context)
                           .colorScheme
                           .secondary),
                   child: Stack(
                     fit: StackFit.loose,
                     clipBehavior: Clip.antiAlias,
                     children: [
                       PositionedDirectional(
                           end: -50,
                           top: -25,
                           child: fancyShimmer(
                             imagePath:
                             state.categories[index].strCategoryThumb ?? '',
                             height: 140.h,
                             width: 140.w,
                             boxFit: BoxFit.contain

                           )),
                       Positioned(
                         bottom: 8,
                         left: 8,
                         right: 8,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                           child: Text(
                            state.categories[index].strCategoryDescription ?? '',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style: TextStyle(
                               color: ColorsManager.white,
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 );
               },  itemCount: state.categories.length);

              }
              if (state is CategoryFailedState) {
                return CustomErrorWidget(text: state.message);
              }
              else {
                return const LoadingWidget();
              }
            }));}}








