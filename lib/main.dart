import 'package:e_commerece/controllers/UI-cotrollers/auth_screen_controller.dart';
import 'package:e_commerece/controllers/UI-cotrollers/bottom_navbar.dart';
import 'package:e_commerece/controllers/UI-cotrollers/tabbar_controller.dart';
import 'package:e_commerece/controllers/data_controllers/item_data.dart';
import 'package:e_commerece/view/screens/auth/auth_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarController>(
            create: (BuildContext context) => BottomNavBarController()),
        ChangeNotifierProvider<AuthScreenController>(
            create: (BuildContext context) => AuthScreenController()),
        ChangeNotifierProvider<GetItems>(
            create: (BuildContext context) => GetItems()),
        ChangeNotifierProvider<TabbarController>(
            create: (BuildContext context) => TabbarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: const SignupScreen(),
      ),
    ),
  );
}
