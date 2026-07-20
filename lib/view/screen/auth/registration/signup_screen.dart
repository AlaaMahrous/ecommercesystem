import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/core/functions/input_validator.dart';
import 'package:ecommercesystem/data/datasource/remote/auth/signup_data.dart';
import 'package:ecommercesystem/view/screen/auth/registration/success_signup_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  StatusRequest statusRequest = StatusRequest.initial;
  bool obscure = true;
  Map<String, dynamic> data = {};
  SignupData signupData = SignupData(Get.find());

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
          centerTitle: true,
          title: Text(
            '11'.tr,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: AppColours.grey),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text('12'.tr, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(
                    '13'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AuthField(
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return inputValidator(val!, 5, 30, "username");
                    },
                    myController: username,
                    label: '14'.tr,
                    hint: '15'.tr,
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedUser),
                  ),
                  const SizedBox(height: 25),
                  AuthField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return inputValidator(val!, 5, 100, "email");
                    },
                    myController: email,
                    label: '16'.tr,
                    hint: '17'.tr,
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                  ),
                  const SizedBox(height: 25),
                  AuthField(
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      return inputValidator(val!, 11, 20, "phone");
                    },
                    myController: phone,
                    label: '18'.tr,
                    hint: '19'.tr,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedAiPhone01,
                    ),
                  ),
                  const SizedBox(height: 25),
                  AuthField(
                    onTapIcon: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    obscureText: obscure,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return inputValidator(val!, 5, 30, "password");
                    },
                    myController: password,
                    label: '20'.tr,
                    hint: '21'.tr,
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedLock),
                  ),
                  const SizedBox(height: 40),
                  CustomAuthButtom(onPressed: signUpMethod, text: '11'.tr),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('23'.tr),
                      InkWell(
                        onTap: () {
                          context.pop(LoginScreen.path);
                        },
                        child: Text(
                          '22'.tr,
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
      ),
    );
  }

  void signUpMethod() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        statusRequest = StatusRequest.loading;
      });
      var response = await signupData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      log("============== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (!mounted) return;
          context.go(SuccessSignupScreen.path);
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
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
