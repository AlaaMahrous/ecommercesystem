import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
  });
  final String label;
  final String hint;
  final Widget icon;
  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: myController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(label),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: icon,
        ),
        hint: Text(hint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
