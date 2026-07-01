import 'package:ecommercesystem/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class LogoAuthImage extends StatelessWidget {
  const LogoAuthImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.logo, height: 102);
  }
}
