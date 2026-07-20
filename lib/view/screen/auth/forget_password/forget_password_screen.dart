import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/core/functions/input_validator.dart';
import 'package:ecommercesystem/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/verify_code_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String path = '/ForgetPasswordScreen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  StatusRequest statusRequest = StatusRequest.initial;
  CheckemailData checkemailData = CheckemailData(Get.find());

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: statusRequest == StatusRequest.loading ? true : false,
      progressIndicator: const CircularProgressIndicator(
        color: AppColours.pPurple,
      ),
      child: Scaffold(
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
                  Text("25".tr, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(
                    '31'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  AuthField(
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return inputValidator(val!, 5, 100, "email");
                    },
                    myController: email,
                    label: '16'.tr,
                    hint: '17'.tr,
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                  ),
                  const SizedBox(height: 40),
                  CustomAuthButtom(onPressed: check, text: '32'.tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void check() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        statusRequest = StatusRequest.loading;
      });
      var response = await checkemailData.postData(email.text);
      log("============== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (mounted) {
            context.push(VerifyCodeResetScreen.path, extra: email.text);
          }
        } else {
          if (!mounted) return;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Email Not Found"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );

          setState(() {
            statusRequest = StatusRequest.failure;
          });
        }
      }
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
