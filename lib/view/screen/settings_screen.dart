import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String path = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
              Container(height: 200, color: AppColours.pPurple),
              const Positioned(
                top: 100,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/ava.jpg'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColours.white,
            child: Column(
              spacing: 5,
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text('Disable Notifications'),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text('Address'),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text('About us'),
                  trailing: const Icon(Icons.help_outline_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text('Contact us'),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Services services = Get.find();
                    services.sharedPreferences.clear();
                    context.go(LoginScreen.path);
                  },
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
