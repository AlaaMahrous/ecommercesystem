import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password_screen.dart';
import 'package:ecommercesystem/view/screen/auth/signup_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String path = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
        backgroundColor: AppColours.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '22'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColours.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                const LogoAuthImage(),
                Text('12'.tr, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                  '24'.tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AuthField(
                  myController: email,
                  label: '16'.tr,
                  hint: '17'.tr,
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                ),
                const SizedBox(height: 25),
                AuthField(
                  myController: password,
                  label: '20'.tr,
                  hint: '21'.tr,
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedLock),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: AlignmentGeometry.centerEnd,
                  child: InkWell(
                    onTap: () {
                      context.push(ForgetPasswordScreen.path);
                    },
                    child: Text(
                      '25'.tr,
                      style: const TextStyle(color: AppColours.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomAuthButtom(onPressed: () {}, text: '22'.tr),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('26'.tr),
                    InkWell(
                      onTap: () {
                        context.push(SignupScreen.path);
                      },
                      child: Text(
                        '11'.tr,
                        style: const TextStyle(
                          color: AppColours.pPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
