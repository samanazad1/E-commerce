import 'package:e_commerece/controllers/data_controllers/authentication_controller.dart';
import 'package:e_commerece/view/config/text_styles.dart';
import 'package:e_commerece/view/screens/main_screen.dart';
import 'package:e_commerece/view/widgets/auth_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _signUp(BuildContext context) async {
    final authController = Provider.of<AuthController>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      ;

      try {
        await authController.createAccount(
          usernameController.text,
          emailController.text,
          passwordController.text,
          
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
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    }
  }

  _signIn(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    try {
      authController.loginToAccount(
          emailController.text, passwordController.text);
    } on FirebaseAuthException {
      //
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainScreen(),
    ));
  }

  _signinAnonymously(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    try {
      authController.loginAnonymously();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    } on FirebaseAuthException {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<AuthController>(context, listen: false);
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
                        Consumer<AuthController>(
                          builder: (context, value, child) =>
                              !value.isLoginScreen
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
                        Consumer<AuthController>(
                            builder: (context, value, child) {
                          return ElevatedButton(
                            onPressed: provider.isLoginScreen
                                ? () => _signIn(context)
                                : () => _signUp(context),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(mq.width, mq.height * 0.06),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: value.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    value.isLoginScreen ? 'Login' : 'Signup',
                                    style: kCustomStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                          );
                        }),
                        Consumer<AuthController>(
                          builder: (context, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  value.changeState();
                                },
                                child: Text(
                                  value.isLoginScreen
                                      ? 'Don\'t have any account? Signup'
                                      : 'Already have an account? Login',
                                  style: kCustomStyle.copyWith(fontSize: 14),
                                ),
                              ),
                              TextButton(
                                onPressed: () => _signinAnonymously(context),
                                child: Text(
                                  value.isLoginScreen
                                      ? ''
                                      : 'Get in as a guest',
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
