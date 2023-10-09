import 'package:e_commerece/controllers/UI-cotrollers/auth_screen_controller.dart';
import 'package:e_commerece/model/services/authentication.dart';
import 'package:e_commerece/view/config/text_styles.dart';
import 'package:e_commerece/view/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  // Create TextEditingController instances for handling input values
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void createUser() {
    Auth auth = Auth();
    if (!_key.currentState!.validate()) {
      return;
    }
    auth.createAccount(usernameController.text, emailController.text,
        passwordController.text, const Uuid().v4());
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Lottie.asset('images/login.json'),
                    Form(
                      child: Column(
                        children: [
                          Consumer<AuthScreenController>(
                            builder: (context, value, child) => !value.isLogin
                                ? TextForm(
                                    obsecure: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field must not be empty';
                                      }
                                      return null;
                                    },
                                    hint: 'Name',
                                    icon: Icons.person,
                                    controller:
                                        usernameController, // Connect controller
                                  )
                                : const SizedBox(),
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          TextForm(
                            obsecure: false,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Enter well formatted email';
                              }
                              return null;
                            },
                            hint: 'Email address',
                            icon: Icons.mail,
                            controller: emailController, // Connect controller
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          TextForm(
                            obsecure: true,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password must be at least 6 char length';
                              }
                              return null;
                            },
                            hint: 'Password',
                            icon: Icons.lock,
                            controller:
                                passwordController, // Connect controller
                          ),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          ElevatedButton(
                            onPressed: createUser,
                            // Use the createUser method
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
                            builder: (context, value, child) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    value.changeState();
                                  },
                                  child: Text(
                                    value.isLogin
                                        ? 'Don\'t have any account? Signup'
                                        : 'Already have an account? Login',
                                    style: kCustomStyle.copyWith(fontSize: 14),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    value.changeState();
                                  },
                                  child: Text(
                                    value.isLogin ? '' : 'Get in as a guest',
                                    style: kCustomStyle.copyWith(
                                        fontSize: 14, color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
