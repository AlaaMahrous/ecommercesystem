import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';

class CustombottomNavigationBar extends StatelessWidget {
  const CustombottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: 55,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        color: AppColours.pPurple,
        child: const Text(
          'Add To Card',
          style: TextStyle(
            color: AppColours.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
