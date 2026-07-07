import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    this.obscureText = false,
    this.onTapIcon,
  });
  final String label;
  final String hint;
  final Widget icon;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      controller: myController,
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
          child: InkWell(onTap: onTapIcon, child: icon),
        ),
        hint: Text(hint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
