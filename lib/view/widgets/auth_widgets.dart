import 'package:e_commerece/view/config/text_styles.dart';
import 'package:flutter/material.dart';
class TextForm extends StatefulWidget {
  final String hint;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscure; // Corrected property name
  final void Function(String?) onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Corrected property type

  const TextForm({
    required this.icon,
    required this.onSaved,
    required this.validator,
    required this.controller,
    required this.obscure, // Corrected property name
    required this.hint,
    required this.textInputType,
    Key? key, // Corrected property name
  }) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onSaved, // Corrected property name
      validator: widget.validator, // Corrected property name
      scrollPadding: const EdgeInsets.symmetric(vertical: 0),
      obscureText: widget.obscure, // Corrected property name
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        errorStyle: kCustomStyle.copyWith(color: Colors.red, fontSize: 10),
        filled: true,
        suffixIcon: Icon(widget.icon),
        suffixIconColor: Colors.green,
        fillColor: const Color.fromARGB(255, 246, 250, 245),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
