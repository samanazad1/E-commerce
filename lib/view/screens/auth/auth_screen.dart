import 'package:e_commerece/controllers/UI-cotrollers/auth_screen_controller.dart';
import 'package:e_commerece/model/services/authentication.dart';
import 'package:e_commerece/view/config/text_styles.dart';
import 'package:e_commerece/view/widgets/auth_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final Auth _authController = Auth();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      final String userId = const Uuid().v4();

      try {
        await _authController.createAccount(
          usernameController.text,
          emailController.text,
          passwordController.text,
          userId,
        );

        // Clear the form after successful registration
        _formKey.currentState!.reset();
      } on FirebaseAuthException catch (err) {
        if (err.code == 'email-already-in-use') {
          // Handle email already in use error
        } else {
          // Handle other authentication errors
        }
      }
    }
  }

  void _signIn() {
    try {
      _authController.loginToAccount(
          emailController.text, passwordController.text);
    } on FirebaseAuthException {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<AuthScreenController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mq.height * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: mq.height * 0.3,
                        child: Lottie.asset('images/login.json')),
                    Column(
                      children: [
                        Consumer<AuthScreenController>(
                          builder: (context, value, child) => !value.isLogin
                              ? TextForm(
                                  textInputType: TextInputType.name,
                                  onSaved: (value) =>
                                      usernameController.text = value!,
                                  obscure: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a name please';
                                    }
                                    return null;
                                  },
                                  hint: 'Name',
                                  icon: Icons.person,
                                  controller: usernameController,
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(height: mq.height * 0.02),
                        TextForm(
                          controller: emailController,
                          onSaved: (value) => emailController.text = value!,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Enter a valid email address please';
                            }
                            return null;
                          },
                          hint: 'Email address',
                          icon: Icons.mail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: mq.height * 0.02),
                        TextForm(
                          textInputType: TextInputType.text,
                          onSaved: (value) => passwordController.text = value!,
                          obscure: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password should be at least 6 characters';
                            }
                            return null;
                          },
                          hint: 'Password',
                          icon: Icons.lock,
                          controller: passwordController,
                        ),
                        SizedBox(height: mq.height * 0.04),
                        ElevatedButton(
                          onPressed: provider.isLogin ? _signIn : _signUp,
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(mq.width, mq.height * 0.06),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          child: Consumer<AuthScreenController>(
                            builder: (context, value, child) => Text(
                              value.isLogin ? 'Login' : 'Signup',
                              style: kCustomStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
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
                                  _authController.loginAnonymously();
                                },
                                child: Text(
                                  value.isLogin ? '' : 'Get in as a guest',
                                  style: kCustomStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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
