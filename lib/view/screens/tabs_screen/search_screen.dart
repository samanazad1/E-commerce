import 'package:e_commerece/view/config/text_styles.dart';
import 'package:e_commerece/view/widgets/widgets_of_home.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mq.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SearchInput(),
          SizedBox(height: mq.height*0.02,),
          Text('Search for any product', style: kCustomStyle.copyWith(fontWeight: FontWeight.w500,fontSize: 16), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
