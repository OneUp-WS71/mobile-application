import 'package:go_router/go_router.dart';
import 'package:mobile_application/security/presentation/login/login_screen.dart';
import 'package:mobile_application/security/presentation/screens.dart';
import 'package:mobile_application/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/splash',
      name: SplashScreen.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: '/profile',
      name: ProfilePage.name,
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);