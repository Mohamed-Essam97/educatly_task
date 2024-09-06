import 'package:educatly/ui/view/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends HookWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);

    return ReactiveForm(
      formGroup: loginForm,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
