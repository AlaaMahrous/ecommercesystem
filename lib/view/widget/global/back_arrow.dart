import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const HugeIcon(
        icon: HugeIcons.strokeRoundedArrowLeft01,
        strokeWidth: 2,
        size: 30,
      ),
    );
  }
}
