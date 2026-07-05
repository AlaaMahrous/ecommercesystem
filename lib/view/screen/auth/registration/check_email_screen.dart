import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/input_validator.dart';
import 'package:ecommercesystem/view/screen/auth/registration/verify_code_signup_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
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
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                const LogoAuthImage(),
                Text("33".tr, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                  '34'.tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AuthField(
                  validator: (val) {
                    return inputValidator(val!, 5, 30, "email");
                  },
                  myController: email,
                  label: '16'.tr,
                  hint: '17'.tr,
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                ),
                const SizedBox(height: 40),
                CustomAuthButtom(onPressed: check, text: '5'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void check() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.push(VerifyCodeSignupScreen.path);
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
