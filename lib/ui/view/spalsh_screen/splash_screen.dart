import 'package:educatly/logic/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void initialization() async {
      final auth = context.read<AuthCubit>();

      await Future.delayed(const Duration(seconds: 2)).then(
        (value) async {
          if (auth.state.isLoggedIn) {
            try {
              context.go('/chat');
            } catch (e) {
              print('An error occurred: $e');
            }
          } else {
            context.go('/login');
          }
        },
      );
    }

    useEffect(() {
      initialization();
      return null;
    }, []);

    return const Scaffold(
      body: Stack(
        children: [],
      ),
    );
  }
}
