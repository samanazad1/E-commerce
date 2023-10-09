import 'package:e_commerece/view/screens/auth/auth_screen.dart';
import 'package:e_commerece/view/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const VerticalSpace(customHeight: 0.009),
          const UserInfo(),
          const VerticalSpace(customHeight: 0.04),
          ProfileActions(
            icon: IconlyLight.logout,
            onPress: () {},
            title: 'logout',
          ),
          const VerticalSpace(customHeight: 0.025),
          ProfileActions(
            icon: IconlyLight.add_user,
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  AuthScreen(),
              ));
            },
            title: 'Register',
          ),
          const VerticalSpace(customHeight: 0.025),
          Divider(
            indent: 30,
            endIndent: 30,
            height: screenHeight * 0.003,
            color: Colors.green,
          ),
          const VerticalSpace(customHeight: 0.025),
          ProfileActions(
              icon: IconlyLight.setting, onPress: () {}, title: 'Settings'),
          const VerticalSpace(customHeight: 0.015),
          ProfileActions(
            icon: IconlyLight.info_circle,
            onPress: () {},
            title: 'About Us',
          ),
          const VerticalSpace(customHeight: 0.015),
          ProfileActions(
            icon: IconlyLight.call,
            onPress: () {},
            title: 'Contact Us',
          ),
        ],
      ),
    );
  }
}
