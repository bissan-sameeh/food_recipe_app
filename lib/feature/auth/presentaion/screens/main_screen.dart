import 'package:flutter/material.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';
import 'package:food_recipe/feature/auth/presentaion/screens/notification_screen.dart';
import 'package:food_recipe/feature/auth/presentaion/screens/profile_screen.dart';

import '../../../../core/helper/image_helper.dart';
import '../../../categories/presentaion/screens/home_screen.dart';
import '../../../detailes_mail/presentaion/screens/show_meal_details_screen.dart';
import '../../../search/presentaion/screens/search_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ImageHelper {
  int selectedIndex = 0;

  List<Widget> barScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  List<BottomNavigationBarItem> get navBar => [
    BottomNavigationBarItem(
        icon: appSvgImage(
            path: 'home',
            width: 24,
            height: 24,
            color: checkIndexColor(0) ? ColorsManager.secondaryLightColor: ColorsManager.black),
        label: "Home"),
    BottomNavigationBarItem(
        icon: appSvgImage(
            path: 'search',
            width: 24,
            height: 24,
            color: checkIndexColor(1) ? ColorsManager.secondaryLightColor: ColorsManager.gray),
        label: "Home"


    ),   BottomNavigationBarItem(
        icon: appSvgImage(
            path: 'notification',
            width: 24,
            height: 24,
            color: checkIndexColor(2) ? ColorsManager.secondaryLightColor: ColorsManager.gray),
        label: "Notification"


    ),   BottomNavigationBarItem(
        icon: appSvgImage(
            path: 'profile',
            width: 24,
            height: 24,
            color: checkIndexColor(3) ? ColorsManager.secondaryLightColor: ColorsManager.gray),
        label: "Profile"


    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: barScreens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: appSvgImage(path: 'chef')
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            boxShadow:

            [
              BoxShadow(
                offset: Offset(0,-10),
                blurRadius: 40,
                spreadRadius: 0,
                color: Color(0xff95A8C326),
              )
            ],

            // borderRadius: BorderRadius.circular(15),
          ),
          child: BottomAppBar(
            height: 90,

            shape: const CircularNotchedRectangle(
            ),


            elevation: 0,
            notchMargin: 9,
            clipBehavior: Clip.antiAlias,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(barScreens.length,(index) =>  InkWell(
                  onTap: () => setState(() {
                    selectedIndex = index;
                    print(selectedIndex);
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                    child: navBar[index].icon,
                  ),
                ))

              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: Icon(
              // elevation: 0,
              //
              //   type: BottomNavigationBarType.fixed,
              //   showSelectedLabels: false,
              //   showUnselectedLabels: false,
              //   backgroundColor: Colors.white,
              //   selectedItemColor: Colors.black,
              //   unselectedIconTheme:
              //       const IconThemeData(color: kLightGray),
              //   onTap: (index) => setState(() {
              //         selectedIndex = index;
              //         print(selectedIndex);
              //       }),
              //   currentIndex: selectedIndex,
              //   items: navBar

            ),
          ),
        ),

      ),

    );

  }

  bool checkIndexColor(int index) => selectedIndex == index;
}
