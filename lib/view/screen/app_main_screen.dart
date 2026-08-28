import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});
  static const String path = '/AppMainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.pPurple,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 4,
        backgroundColor: AppColours.white,
        onPressed: () {},
        child: const HugeIcon(icon: HugeIcons.strokeRoundedShoppingBasket01),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColours.white,
        child: Row(
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                  Text('Home'),
                ],
              ),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {},
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                  Text('Home'),
                ],
              ),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {},
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                  Text('Home'),
                ],
              ),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {},
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                  Text('Home'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('main')),
    );
  }
}
