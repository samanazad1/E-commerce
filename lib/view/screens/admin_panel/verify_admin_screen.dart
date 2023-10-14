import 'package:e_commerece/app/key.dart';
import 'package:e_commerece/view/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class VerifyAdmin extends StatefulWidget {
  const VerifyAdmin({super.key});

  @override
  State<VerifyAdmin> createState() => _VerifyAdminState();
}

class _VerifyAdminState extends State<VerifyAdmin> {
  final keyController = TextEditingController();

  final GlobalKey _key = GlobalKey<FormState>();
  
  void verifyAdmin() {
    if (keyController.text.trim() == adminPanelKey) {
      print("You have got the admin panel role in this app");
    } else {
      print('stfu');
    }
  }

  @override
  void dispose() {
    super.dispose();
    keyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Admin Panel',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: mq.height * 0.1,
              ),
              Lottie.asset('images/admin.json'),
              SizedBox(
                height: mq.height * 0.05,
              ),
              Text(
                'Enter the specified to key to join as an admin',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: mq.height * 0.05,
              ),
              Form(
                key: _key,
                child: TextForm(
                    icon: Icons.key,
                    onSaved: (value) {
                      keyController.text = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return 'Please enter a valid key here ';
                      }
                      return null;
                    },
                    controller: keyController,
                    obscure: false,
                    hint: 'Key',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: mq.height * 0.05,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    verifyAdmin();
                  },
                  child: Text(
                    'Get Login Panel',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
