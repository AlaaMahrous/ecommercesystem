import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String path = '/LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
        backgroundColor: AppColours.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Sign In",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColours.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                const LogoAuthImage(),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Sign in with your email and password\nor continue with social media",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const AuthField(
                  //myController: ,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                ),
                const SizedBox(height: 25),
                const AuthField(
                  //myController: ,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedLock),
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: AlignmentGeometry.centerEnd,
                  child: Text(
                    'Forget Password',
                    style: TextStyle(color: AppColours.grey),
                  ),
                ),
                const SizedBox(height: 10),
                CustomAuthButtom(onPressed: () {}, text: 'Sign In'),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
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
