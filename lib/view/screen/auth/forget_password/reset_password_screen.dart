import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/input_validator.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/success_reset_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const String path = '/ResetPasswordScreen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
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
                Text("27".tr, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                  '28'.tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AuthField(
                  onTapIcon: () {
                    setState(() {
                      obscure1 = !obscure1;
                    });
                  },
                  obscureText: obscure1,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return inputValidator(val!, 5, 30, "password");
                  },
                  myController: password,
                  label: '20'.tr,
                  hint: '21'.tr,
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedLock),
                ),
                const SizedBox(height: 25),
                AuthField(
                  onTapIcon: () {
                    setState(() {
                      obscure2 = !obscure2;
                    });
                  },
                  obscureText: obscure2,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return inputValidator(val!, 5, 30, "password");
                  },
                  myController: repassword,
                  label: '20'.tr,
                  hint: '29'.tr,
                  icon: const HugeIcon(icon: HugeIcons.strokeRoundedLock),
                ),
                const SizedBox(height: 40),
                CustomAuthButtom(onPressed: check, text: '30'.tr),
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
      context.push(SuccessResetScreen.path);
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
