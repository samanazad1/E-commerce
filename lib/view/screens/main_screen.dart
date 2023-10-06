import 'package:e_commerece/controllers/UI-cotrollers/bottom_navbar.dart';
import 'package:e_commerece/view/screens/tabs_screen/fav_screen.dart';
import 'package:e_commerece/view/screens/tabs_screen/home_screen.dart';
import 'package:e_commerece/view/screens/tabs_screen/search_screen.dart';
import 'package:e_commerece/view/widgets/bottom_nav.dart';
import 'package:e_commerece/view/widgets/shopping_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreen(),
      SearchScreen(),
      FavScreen(),
      Center(
        child: Text('pro'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Consumer<BottomNavBarController>(
          builder: (context, value, child) => Text(
            value.index == 0
                ? 'Discover'
                : (value.index == 1
                    ? 'Search'
                    : (value.index == 2 ? 'Favorite' : 'Profile')),
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 21),
          ),
        ),
        actions: const [
          ShoppingIcon(),
        ],
      ),
      body: Consumer<BottomNavBarController>(
        builder: (context, value, child) =>
            IndexedStack(index: value.index, children: screens),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
