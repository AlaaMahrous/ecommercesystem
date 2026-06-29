import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/screen/language_screen.dart';
import 'package:ecommercesystem/view/screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static late final GoRouter router;

  static Future<void> init() async {
    router = GoRouter(
      initialLocation: LanguageScreen.path,
      routes: [
        GoRoute(
          path: OnboardingScreen.path,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: LoginScreen.path,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: LanguageScreen.path,
          builder: (context, state) => const LanguageScreen(),
        ),
      ],
    );
  }
}
