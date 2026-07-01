import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/localization/app_translation.dart';
import 'package:ecommercesystem/core/localization/localization_controller.dart';
import 'package:ecommercesystem/core/router/app_router.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await AppRouter.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 835),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocalizationController(),
      builder: (controller) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appThemeData(),
          translations: AppTranslation(),
          locale: controller.language,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        );
      },
    );
  }

  ThemeData appThemeData() => ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: AppColours.grey,
        fontSize: 15.5,
      ),
    ),
  );
}
