import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/helper/image_helper.dart';

import '../../../../core/widgets/favorite_widget.dart';
import '../../../random/presentaion/widgets/recipe/recipe_widget.dart';
import '../bloc/cubit/favorite_cubit.dart';
import '../widgets/favorites_widget/favorite_widget_custom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ImageHelper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: appSvgImage(path: 'setting'),
          )
        ],
      ),
      body: const FavoriteWidgetCustom(),
    );
  }
}
