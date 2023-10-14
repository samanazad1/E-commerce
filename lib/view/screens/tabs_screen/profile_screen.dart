import 'package:e_commerece/controllers/data_controllers/authentication_controller.dart';
import 'package:e_commerece/view/screens/auth/auth_screen.dart';
import 'package:e_commerece/view/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLogin = false;
  String name ='' ;
  @override
  void initState() {
    final provider = Provider.of<AuthController>(context, listen: false);
    super.initState();
    _isLogin = provider.isUser;
    name = provider.name;
  }

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
          const UserInfo(
          
          ),
          const VerticalSpace(customHeight: 0.04),
          const VerticalSpace(customHeight: 0.025),
          Consumer<AuthController>(builder: (context, value, child) {
            return ProfileActions(
              icon: _isLogin ? IconlyLight.logout : IconlyLight.add_user,
              onPress: _isLogin
                  ? () {
                      value.logout();
                    }
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ));
                    },
              title: _isLogin ? 'Logout' : 'Register',
            );
          }),
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
