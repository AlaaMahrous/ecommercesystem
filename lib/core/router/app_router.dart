import 'package:ecommercesystem/core/services/settings_service.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/view/screen/app_main_screen.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:ecommercesystem/view/screen/auth/registration/signup_screen.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/success_reset_screen.dart';
import 'package:ecommercesystem/view/screen/auth/registration/success_signup_screen.dart';
import 'package:ecommercesystem/view/screen/auth/forget_password/verify_code_screen.dart';
import 'package:ecommercesystem/view/screen/auth/registration/verify_code_signup_screen.dart';
import 'package:ecommercesystem/view/screen/home_screen.dart';
import 'package:ecommercesystem/view/screen/item_screen.dart';
import 'package:ecommercesystem/view/screen/language_screen.dart';
import 'package:ecommercesystem/view/screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static late final GoRouter router;

  static Future<void> init() async {
    router = GoRouter(
      initialLocation: _getInitialLocation(),
      routes: [
        GoRoute(
          path: LanguageScreen.path,
          builder: (context, state) => const LanguageScreen(),
        ),
        GoRoute(
          path: OnboardingScreen.path,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: LoginScreen.path,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: SignupScreen.path,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: ForgetPasswordScreen.path,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: VerifyCodeResetScreen.path,
          builder: (context, state) {
            final email = state.extra as String;
            return VerifyCodeResetScreen(email: email);
          },
        ),
        GoRoute(
          path: VerifyCodeSignupScreen.path,
          builder: (context, state) => const VerifyCodeSignupScreen(),
        ),
        GoRoute(
          path: ResetPasswordScreen.path,
          builder: (context, state) {
            final email = state.extra as String;
            return ResetPasswordScreen(email: email);
          },
        ),
        GoRoute(
          path: SuccessResetScreen.path,
          builder: (context, state) => const SuccessResetScreen(),
        ),
        GoRoute(
          path: SuccessSignupScreen.path,
          builder: (context, state) => const SuccessSignupScreen(),
        ),
        GoRoute(
          path: AppMainScreen.path,
          builder: (context, state) => const AppMainScreen(),
        ),
        GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: ItemScreen.path,
          builder: (context, state) {
            final categoryName = state.extra as CategoryModel;
            return ItemScreen(category: categoryName);
          },
        ),
      ],
    );
  }

  static String _getInitialLocation() {
    if (!SettingsService.languageSelected) {
      return LanguageScreen.path;
    }

    if (!SettingsService.onboardingCompleted) {
      return OnboardingScreen.path;
    }

    if (SettingsService.isLoggedIn) {
      return AppMainScreen.path;
    }

    return LoginScreen.path;
  }
}
