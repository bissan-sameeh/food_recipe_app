import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/categories/presentaion/widgets/home_widgets/category/success_category_list.dart';

import '../../../../../../core/shimmer/home_shimmer/category_loading.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_list_tile.dart';
import '../../../bloc/category_bloc/category_bloc.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

    const CustomListTile(leading: 'Category', trailing: 'see More',),

    BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if(state is CategorySuccessState ){
              return SuccessCategoryList(categoryModel: state.categories);}
            else if(state is CategoryFailedState){
              return CustomErrorWidget(text:state.message);
            }else{
              return const LoadingWidget();
            }
          },
        ),
      ],
    );
  }
}
