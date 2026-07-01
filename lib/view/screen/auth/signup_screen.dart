import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String path = '/SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
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
          "Sign In",
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
                const SizedBox(height: 15),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Create your account to start shopping\nor continue with social media",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                AuthField(
                  myController: username,
                  label: 'Username',
                  hint: 'Enter Your Username',
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedUser),
                ),
                const SizedBox(height: 25),
                AuthField(
                  myController: email,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                ),
                const SizedBox(height: 25),
                AuthField(
                  myController: phone,
                  label: 'Phone',
                  hint: 'Enter Your Phone',
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedAiPhone01),
                ),
                const SizedBox(height: 25),
                AuthField(
                  myController: password,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedLock),
                ),
                const SizedBox(height: 40),
                CustomAuthButtom(onPressed: () {}, text: 'Sign Up'),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: () {
                        context.pop(LoginScreen.path);
                      },
                      child: const Text(
                        'Sign In',
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
