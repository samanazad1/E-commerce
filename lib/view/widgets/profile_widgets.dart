import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../config/text_styles.dart';

class ProfileActions extends StatefulWidget {
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
  State<ProfileActions> createState() => _ProfileActionsState();
}

class _ProfileActionsState extends State<ProfileActions> {
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
        onTap: widget.onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.green,
                  size: 30,
                ),
                const HorizontalSpace(customWidth: 0.04),
                Text(widget.title, style: kCustomStyle),
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

class VerticalSpace extends StatelessWidget {
  final double customHeight;
  const VerticalSpace({
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

class HorizontalSpace extends StatelessWidget {
  final double customWidth;
  const HorizontalSpace({
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
  String? uid;
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final _auth = FirebaseAuth.instance.currentUser;

    if (_auth != null) {
      uid = _auth.uid;
      email = _auth.email;

      final firestore = await FirebaseFirestore.instance
          .collection('userData')
          .doc(_auth.uid)
          .get();

      if (firestore.exists) {
        setState(() {
          name = firestore.get('name');
        });
      }
    }
  }

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
            backgroundImage: AssetImage('images/guest.png'),
          ),
          const VerticalSpace(customHeight: 0.01),
            Text(
            '$name',
            style: const TextStyle(color: Colors.black),
          ),
        ],

      ),
    );
  }
}
