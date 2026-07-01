import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';

class CustomAuthButtom extends StatelessWidget {
  const CustomAuthButtom({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      minWidth: double.infinity,
      height: 50,
      onPressed: onPressed,
      color: AppColours.pPurple,
      textColor: AppColours.white,
      child: Text(text),
    );
  }
}
