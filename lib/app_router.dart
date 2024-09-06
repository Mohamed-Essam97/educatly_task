import 'package:educatly/ui/view/auth/login/login_screen.dart';
import 'package:educatly/ui/view/auth/signup/sign_up_screen.dart';
import 'package:educatly/ui/view/chat/chat_screen.dart';
import 'package:educatly/ui/view/home/home_page.dart';
import 'package:educatly/ui/view/spalsh_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
// GoRouter configuration
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'splashScreen',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
          name: 'chat',
          path: '/chat',
          builder: (context, state) {
            return ChatScreen(
              userId: '0',
            );
          }),
    ],
    // redirect: _guard,
  );
}
