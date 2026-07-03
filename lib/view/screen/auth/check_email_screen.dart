import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/screen/auth/success_signup_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key});
  static const String path = '/CheckEmailScreen';

  @override
  State<CheckEmailScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<CheckEmailScreen> {
  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
        backgroundColor: AppColours.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                const LogoAuthImage(),
                Text(
                  "Check Email",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Please Enter Your Email Address to Recive A verification code",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AuthField(
                  myController: email,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                ),
                const SizedBox(height: 40),
                CustomAuthButtom(
                  onPressed: () {
                    context.push(SuccessSignupScreen.path);
                  },
                  text: 'Check',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
