import 'package:e_commerece/view/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:mq.width*0.05),
      child: Center(
        child: Center(
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 125),
                Lottie.asset('images/empty.json'),
                Text('You haven\'t booked a favorite item yet', style: kCustomStyle.copyWith(fontSize: 16),),
              ],
            )
          
        ),
      ),
    );
  }
}