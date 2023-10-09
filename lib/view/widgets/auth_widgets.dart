import 'package:e_commerece/view/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final bool obsecure;
  const TextForm({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator, required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        
          errorStyle: kCustomStyle.copyWith(color: Colors.red, fontSize: 13),
          filled: true,
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(color: Colors.green),
          prefixIcon: Icon(
            icon,
            color: Colors.green,
          ),
          fillColor: const Color.fromARGB(255, 247, 250, 247),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
