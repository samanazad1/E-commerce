import 'package:e_commerece/view/config/text_styles.dart';
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
          VerticalSpace(customHeight: 0.009),
          const UserInfo(),
          VerticalSpace(customHeight: 0.04),
          ProfileActions(
            icon: IconlyLight.logout,
            onPress: () {},
            title: 'logout',
          ),
          VerticalSpace(customHeight: 0.025),
          ProfileActions(
            icon: IconlyLight.add_user,
            onPress: () {},
            title: 'Register',
          ),
          VerticalSpace(customHeight: 0.025),
          Divider(
            indent: 30,
            endIndent: 30,
            height: screenHeight * 0.003,
            color: Colors.green,
          ),
          VerticalSpace(customHeight: 0.025),
          ProfileActions(
              icon: IconlyLight.setting, onPress: () {}, title: 'Settings'),
          VerticalSpace(customHeight: 0.015),
          ProfileActions(
            icon: IconlyLight.info_circle,
            onPress: () {},
            title: 'About Us',
          ),
          VerticalSpace(customHeight: 0.015),
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

class ProfileActions extends StatelessWidget {
  final String title;
  final void Function() onPress;
  final IconData icon;

  const ProfileActions({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: InkWell(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.green,
                  size: 30,
                ),
                HorizontalSpace(customWidth: 0.04),
                Text(title, style: kCustomStyle),
              ],
            ),
            const Icon(
              IconlyLight.arrow_right_2,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class VerticalSpace extends StatelessWidget {
  double customHeight;
  VerticalSpace({
    super.key,
    required this.customHeight,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * customHeight,
    );
  }
}

// ignore: must_be_immutable
class HorizontalSpace extends StatelessWidget {
  double customWidth;
  HorizontalSpace({
    super.key,
    required this.customWidth,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * customWidth,
    );
  }
}

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            maxRadius: 36,
            minRadius: 10,
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage('https://www.pngmart.com/files/21/Account-Avatar-Profile-PNG-Clipart.png'),
          ),
          VerticalSpace(customHeight: 0.01),
          Text(
            'Guest',
            style: kCustomStyle,
          ),
          VerticalSpace(customHeight: 0.01),
        ],
      ),
    );
  }
}
