import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';

class LangButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const LangButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: AppColours.pPurple,
      textColor: AppColours.white,
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
