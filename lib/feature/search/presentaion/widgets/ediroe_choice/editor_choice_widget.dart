import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';
import 'package:food_recipe/core/styles/styles.dart';
import 'package:food_recipe/feature/search/presentaion/widgets/ediroe_choice/editor_list.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_list_tile.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../random/presentaion/bloc/random_bloc.dart';

class EditorChoiceWidget extends StatefulWidget {
  const EditorChoiceWidget({super.key});

  @override
  State<EditorChoiceWidget> createState() => _EditorChoiceWidgetState();
}

class _EditorChoiceWidgetState extends State<EditorChoiceWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RandomBloc>().add(GetRandomEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomListTile(
          leading: 'Editor\'s Choice',
          trailing: 'See More',
        ),
        BlocBuilder<RandomBloc, RandomState>(
          builder: (context, state) {
            if (state is RandomSuccessState) {
              return EditorList(meals: state.meals);
            } else if (state is RandomFailedState) {
              return CustomErrorWidget(text: state.message);
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ],
    );
  }
}
