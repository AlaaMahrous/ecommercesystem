import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/core/functions/input_validator.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:ecommercesystem/core/services/settings_service.dart';
import 'package:ecommercesystem/data/datasource/remote/auth/login_data.dart';
import 'package:ecommercesystem/view/screen/app_main_screen.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:ecommercesystem/view/screen/auth/registration/signup_screen.dart';
import 'package:ecommercesystem/view/widget/auth/auth_field.dart';
import 'package:ecommercesystem/view/widget/auth/custom_auth_buttom.dart';
import 'package:ecommercesystem/view/widget/auth/logo_auth_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.initial;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  LoginData loginData = LoginData(Get.find());
  Services services = Get.find();
  bool obscure = true;

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) {
      if (value != null) {
        log('FCM token: $value');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
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
            '22'.tr,
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
                  CustomAuthButtom(onPressed: logInMethod, text: '22'.tr),
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
      ),
    );
  }

  void logInMethod() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        statusRequest = StatusRequest.loading;
      });
      var response = await loginData.postData(email.text, password.text);
      log("============== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          await SettingsService.setLoggedIn(true);
          services.sharedPreferences.setString(
            "id",
            "${response['data']['user_id']}",
          );
          services.sharedPreferences.setString(
            "user_name",
            response['data']['user_name'],
          );
          services.sharedPreferences.setString(
            "email",
            response['data']['user_email'],
          );
          services.sharedPreferences.setString(
            "phone",
            response['data']['user_phone'],
          );
          if (mounted) {
            context.push(AppMainScreen.path);
          }
        } else {
          if (!mounted) return;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Email or password not correct"),
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
