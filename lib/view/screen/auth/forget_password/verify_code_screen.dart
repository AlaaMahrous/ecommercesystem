import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/data/datasource/remote/forgetpassword/verifycodereset.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeResetScreen extends StatefulWidget {
  const VerifyCodeResetScreen({super.key, required this.email});
  static const String path = '/VerifyCodeScreen';
  final String email;

  @override
  State<VerifyCodeResetScreen> createState() => _VerifyCodeResetScreenState();
}

class _VerifyCodeResetScreenState extends State<VerifyCodeResetScreen> {
  VerifycoderesetData verifycoderesetData = VerifycoderesetData(Get.find());
  StatusRequest statusRequest = StatusRequest.initial;
  String verifyCode = '';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  const LogoAuthImage(),
                  Text("3".tr, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(
                    "4".tr,
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
                      setState(() {
                        verifyCode = verificationCode;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomAuthButtom(onPressed: check, text: '5'.tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void check() async {
    if (verifyCode.isNotEmpty) {
      setState(() {
        statusRequest = StatusRequest.loading;
      });
      var response = await verifycoderesetData.postData(
        widget.email,
        verifyCode,
      );
      log("============== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (!mounted) return;
          context.push(ResetPasswordScreen.path, extra: widget.email);
        } else {
          if (!mounted) return;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Phone number or email already exist"),
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
    }
  }
}
