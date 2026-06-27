import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CircularArrowProgress extends StatelessWidget {
  final double progress;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  final Color innerCircleColor;

  const CircularArrowProgress({
    super.key,
    required this.progress,
    this.size = 78,
    this.backgroundColor = const Color(0xFFE5E7EB),
    this.progressColor = AppColours.pPurple,
    this.innerCircleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 29.5,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation(progressColor),
          ),

          Container(
            height: size * 0.65,
            width: size * 0.65,
            decoration: BoxDecoration(
              color: innerCircleColor,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: const Center(
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                size: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
