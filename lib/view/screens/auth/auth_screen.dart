import 'package:e_commerece/controllers/UI-cotrollers/auth_screen_controller.dart';
import 'package:e_commerece/view/config/text_styles.dart';
import 'package:e_commerece/view/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset('images/login.json'),
                Form(
                  child: Column(
                    children: [
                      Consumer<AuthScreenController>(
                        builder: (context, value, child) => !value.isLogin
                            ? const TextForm(
                                hint: 'Name',
                                icon: Icons.person,
                              )
                            : const SizedBox(),
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      const TextForm(
                        hint: 'Email address',
                        icon: Icons.mail,
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      const TextForm(
                        hint: 'Password',
                        icon: Icons.lock,
                      ),
                      SizedBox(
                        height: mq.height * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(mq.width, mq.height * 0.06),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.green),
                        child: Consumer<AuthScreenController>(
                            builder: (context, value, child) => Text(
                                  value.isLogin ? 'Login' : 'Signup',
                                  style: kCustomStyle.copyWith(
                                      color: Colors.white, fontSize: 16),
                                )),
                      ),
                      Consumer<AuthScreenController>(
                          builder: (context, value, child) => TextButton(
                                onPressed: () {
                                  value.changeState();
                                },
                                child: Text(
                                  value.isLogin
                                      ? 'Don\'t have any account? Singup'
                                      : 'Already have account? Login',
                                  style: kCustomStyle.copyWith(fontSize: 14),
                                ),
                              )),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
