import 'package:educatly/logic/auth/auth_cubit.dart';
import 'package:educatly/logic/auth/auth_state.dart';
import 'package:educatly/ui/themes/text_theme.dart';
import 'package:educatly/ui/widgets/buttons/custom_outline_button.dart';
import 'package:educatly/ui/widgets/text_utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

final _signUpForm = FormGroup(
  {
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'userName': FormControl<String>(
      validators: [Validators.email, Validators.required],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
  },
);

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state.isLoggedIn) {
            context.go('/chat');
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  "SIGN UP",
                  style: context.h1,
                ),
                SignUpFoemWidget(isPasswordVisible: isPasswordVisible)
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SignUpFoemWidget extends HookWidget {
  const SignUpFoemWidget({
    super.key,
    required this.isPasswordVisible,
  });

  final ValueNotifier<bool> isPasswordVisible;

  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthCubit>(context, listen: true);

    handleSignUp() async {
      if (_signUpForm.valid) {
        final name = _signUpForm.control('name').value;
        final email = _signUpForm.control('userName').value;
        final password = _signUpForm.control('password').value;

        await auth.signUpWithEmail(email, password, name);
      } else {
        _signUpForm.markAllAsTouched();
      }
    }

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return ReactiveForm(
        formGroup: _signUpForm,
        child: Column(
          children: [
            ReactiveTextField(
              formControlName: "name",
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              autofillHints: const [AutofillHints.email],
            ),
            const Gap(8),
            ReactiveTextField(
              formControlName: "userName",
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              autofillHints: const [AutofillHints.email],
            ),
            const Gap(8),
            ReactiveTextField(
              formControlName: "password",
              obscureText: !isPasswordVisible.value,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    isPasswordVisible.value = !isPasswordVisible.value;
                  },
                ),
              ),
            ),
            const Gap(24),
            CustomOutLineButton(
              busy: state.isSignUpLoadin,
              onPressed: () {
                handleSignUp();
              },
              text: "CREATE ACCOUNT",
            )
          ],
        ),
      );
    });
  }
}
