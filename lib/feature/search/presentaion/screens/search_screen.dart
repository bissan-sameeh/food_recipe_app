import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/widgets/custom_error_widget.dart';
import 'package:food_recipe/core/widgets/loading_widget.dart';
import 'package:food_recipe/feature/random/presentaion/bloc/random_bloc.dart';
import 'package:food_recipe/feature/random/presentaion/widgets/recipe/recipe_widget.dart';

import '../../../../core/helper/debouncer.dart';
import '../../../../core/models/meal_model/meal_model.dart';
import '../../../categories/presentaion/bloc/category_bloc/category_bloc.dart';
import '../../../categories/presentaion/widgets/home_widgets/category/success_category_list.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/ediroe_choice/editor_choice_widget.dart';
import '../widgets/my_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  late Debouncer debouncer;
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
    debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    searchController.addListener(() {
      final text = searchController.text.trim();
      debouncer.call(() {
        final wasSearching = isSearching; //false //again=> true
        setState(() =>
          isSearching = text.isNotEmpty //true (Seafood) => if empty => false يعني مسحنا
        );

        if (isSearching) { //true
          context.read<SearchBloc>().add(SearchByCategoryEvent(category: text));
        } else if (wasSearching && text.isEmpty) { // مسحنا والنص فاضي وفش حاجة جديدة ابحث عنها :
          context.read<CategoryBloc>().add(GetListCategoriesEvent());
        }
      });
    });

    context.read<RandomBloc>().add(GetRandomEvent());



  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        children: [
          //SearchBar
          MyTexField(
            textEditingController: searchController,
            hint: 'Search',
            isPrefix: true,
            onChanged: (text) {
            } ),
          //HERE All Categories and if search about an category the result will returned model class
          Padding(
            padding:  EdgeInsets.only(top: 8.0.h),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
                 isSearching?  BlocBuilder<SearchBloc, SearchState>(
                      key: const ValueKey('search'),
                      builder: (context, state) {
                        print('kkkkkkkkkkkkkkkkkkk');
                        if (state is SearchSuccessState) {
                          print('successs');

                          List<MealModel>? meals=state.meals;
                          print(meals);
                          if(meals!.isEmpty){
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                              child: const Text("No Meals ! try again!"),
                            );
                          }else{
                          return SuccessCategoryList(
                            mealModel: meals,
                          );}
                        } else if (state is SearchFailedState) {
                          return CustomErrorWidget(text: state.message);
                        } else {
                          return const LoadingWidget();
                        }
                      },
                    )
                  : BlocBuilder<CategoryBloc, CategoryState>(
                      key: const ValueKey('category'),
                      builder: (context, state) {
                        if (state is CategorySuccessState) {
                          return SuccessCategoryList
                            (

                              categoryModel: state.categories,


                          );
                        } else if (state is CategoryFailedState) {
                          return CustomErrorWidget(text: state.message);
                        } else {
                          return const LoadingWidget();
                        }
                      },
                    ),
            ),
          ),
          //Popular Recipe

          const RecipeWidget(
            isSearchScreen: true,
            heightSizedBox: 175,heightContainer: 84,widthContainer: 100,),

          //Edior'sChoice

                  const EditorChoiceWidget()

        ],
      ),
    );
  }
}
