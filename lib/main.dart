import 'package:e_commerece/controllers/UI-cotrollers/bottom_navbar.dart';
import 'package:e_commerece/controllers/UI-cotrollers/tabbar_controller.dart';
import 'package:e_commerece/controllers/data_controllers/authentication_controller.dart';
import 'package:e_commerece/controllers/data_controllers/item_data.dart';
import 'package:e_commerece/firebase_options.dart';
import 'package:e_commerece/view/screens/auth/auth_screen.dart';
import 'package:e_commerece/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarController>(
            create: (BuildContext context) => BottomNavBarController()),
        ChangeNotifierProvider<AuthController>(
            create: (BuildContext context) => AuthController()),
        ChangeNotifierProvider<GetItems>(
            create: (BuildContext context) => GetItems()),
        ChangeNotifierProvider<TabbarController>(
            create: (BuildContext context) => TabbarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? (snapshot.connectionState == ConnectionState.waiting
                      ? const CircularProgressIndicator()
                      : const MainScreen())
                  :  AuthScreen();
            }),
      ),
    ),
  );
}
