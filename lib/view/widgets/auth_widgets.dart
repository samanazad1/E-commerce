
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final IconData icon;

  const TextForm({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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
