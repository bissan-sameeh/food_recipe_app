import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/styles/theme_manager.dart';
import 'package:food_recipe/feature/auth/presentaion/screens/main_screen.dart';
import 'package:food_recipe/feature/categories/presentaion/bloc/category_bloc/category_bloc.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/bloc/details_meal_bloc/details_meal_bloc.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/screens/show_meal_details_screen.dart';
import 'package:food_recipe/feature/ingradients/presentaion/bloc/ingredient/ingredient_bloc.dart';
import 'package:food_recipe/feature/random/presentaion/bloc/random_bloc.dart';
import 'package:food_recipe/feature/search/presentaion/bloc/search_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/routers/route_helper.dart';
import 'core/routers/routes.dart';
import 'feature/categories/data/models/category_model_adapter.dart';
import 'dependancy_injection.dart' as di;
import 'feature/detailes_mail/data/models/favorite_meal_adapter.dart';
import 'feature/ingradients/presentaion/cubit/ingredient_reader/ingredient_reader_cubit.dart';

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(FavoriteMealModelAdapter());

  await di.init();

  // Hive.openBox(HiveConstants.categoryBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => di.sl<CategoryBloc>()
                ..add(
                  GetAllCategoriesEvent(),
                )
                ..add(GetListCategoriesEvent())),
          BlocProvider(
            create: (context) => di.sl<SearchBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<RandomBloc>()
              ..add(GetRandomEvent())
          ),
          BlocProvider(
            create: (context) => di.sl<DetailsMealBloc>()..add(const GetMealsDetailsEvent(mealId: '52772'))
          ),
          BlocProvider(
            create: (context) => di.sl<IngredientBloc>()
          ),
          BlocProvider(
            create: (context) => di.sl<IngredientReaderCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getThemeData(),
          onGenerateRoute: generateRoute,
          home: const MainScreen(),
          routes: {
            Routes.detailsMeal: (context) => const ShowMealDetailsScreen(),
          },
        ),
      );
    });
  }
}
