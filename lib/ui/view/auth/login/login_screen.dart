import 'package:educatly/logic/auth/auth_cubit.dart';
import 'package:educatly/logic/auth/auth_state.dart';
import 'package:educatly/ui/themes/text_theme.dart';
import 'package:educatly/ui/view/auth/login/widgets/login_form_widget.dart';
import 'package:educatly/ui/widgets/buttons/custom_normal_button.dart';
import 'package:educatly/ui/widgets/buttons/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

final loginForm = FormGroup(
  {
    'userName': FormControl<String>(
        validators: [Validators.required], value: "m.essam@gmail.com"),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
        value: '123456789'),
  },
);

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthCubit>(context, listen: true);

    handleLogin() async {
      if (loginForm.valid) {
        final email = loginForm.control('userName').value;
        final password = loginForm.control('password').value;

        await auth.loginWithEmail(email, password);
      } else {
        loginForm.markAllAsTouched();
      }
    }

    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state.isLoggedIn) {
            context.go('/chat');
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: context.h1,
                  ),
                  const LoginForm(),
                  const Gap(24),
                  NormalButton(
                    onPressed: handleLogin,
                    busy: auth.state.isLoggingIn,
                    text: 'LOG IN',
                  ),
                  CustomOutLineButton(
                    onPressed: () {
                      context.push('/signup');
                    },
                    busy: false,
                    text: "SIGN UP",
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
