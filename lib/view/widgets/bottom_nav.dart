import 'package:e_commerece/controllers/UI-cotrollers/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  // Define icon data for both IconlyLight and IconlyBold
  final List<IconData> iconlyLightIcons = [
    IconlyLight.home,
    IconlyLight.search,
    IconlyLight.heart,
    IconlyLight.profile,
  ];

  final List<IconData> iconlyBoldIcons = [
    IconlyBold.home,
    IconlyBold.search,
    IconlyBold.heart,
    IconlyBold.profile,
  ];

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarController>(
      builder: (context, controller, child) => BottomNavigationBar(
        onTap: controller.changeIndex,
        currentIndex: controller.index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            GoogleFonts.montserrat(color: Colors.green, fontSize: 15),
        unselectedLabelStyle:
            GoogleFonts.montserrat(color: Colors.black, fontSize: 15),
        items: List.generate(4, (i) {
          return BottomNavigationBarItem(
            icon: Icon(controller.index == i
                ? iconlyBoldIcons[i]
                : iconlyLightIcons[i]),
            label: getLabel(i),
          );
        }),
      ),
    );
  }

  String getLabel(int i) {
    switch (i) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Favorite';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
