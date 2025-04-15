import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/routers/router.dart';
import 'package:food_recipe/feature/auth/presentaion/widgets/title_widget.dart';
import 'package:food_recipe/feature/detailes_mail/presentaion/widgets/sub_title_widget.dart';

import '../../../../core/styles/colors_manager.dart';
import '../widgets/custom_btn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3,),() => NavigationRoutes().jump(context, Routes.mainScreen),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_image.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
              end: 16,
              top: 40,
              child: InkWell(
                  onTap: () =>
                      NavigationRoutes().jump(context, Routes.mainScreen),
                  child: Text(
                    'later',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white),
                  ))),
          PositionedDirectional(
              end: 16,
              top: 40,
              child: InkWell(
                  onTap: () =>
                      NavigationRoutes().jump(context, Routes.mainScreen),
                  child: Text(
                    'later',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white),
                  ))),
          const PositionedDirectional(
            end: 0,
            start: 0,
            bottom: 40,
            child: Column(
              children: [
                TitleWidget(
                    text: "Help your path to health\ngoals with happiness"),
                CustomBtn(),
                TitleWidget(text: 'Create New Account'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
