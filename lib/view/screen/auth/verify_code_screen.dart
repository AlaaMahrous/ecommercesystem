import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/screen/auth/reset_password_screen.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});
  static const String path = '/VerifyCodeScreen';

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
                  "Check Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "We've sent a verification code to your email. Enter it below to continue",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                OtpTextField(
                  numberOfFields: 5,
                  fieldWidth: 45,
                  disabledBorderColor: AppColours.grey,
                  borderColor: AppColours.pPurple,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    context.push(ResetPasswordScreen.path);
                  },
                ),
                const SizedBox(height: 40),
                CustomAuthButtom(
                  onPressed: () {
                    context.push(ResetPasswordScreen.path);
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
