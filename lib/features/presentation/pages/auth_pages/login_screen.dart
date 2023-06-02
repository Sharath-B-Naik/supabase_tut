import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/presentation/controller/auth_controller.dart';
import 'package:note_app/features/presentation/pages/auth_pages/signup_screen.dart';
import 'package:note_app/widgets/app_button.dart';
import 'package:note_app/widgets/app_text.dart';
import 'package:note_app/widgets/app_text_form_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const AppText(
              "Sign In",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 50),
            AppTextFormField(
              controller: provider.emailController,
              hintText: 'Enter email address',
            ),
            const SizedBox(height: 10),
            AppTextFormField(
              controller: provider.passwordController,
              hintText: 'Enter password',
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                text: "Forgot Password",
                height: 20,
                width: 100,
                elevation: 0,
                textColor: Colors.black87,
                backgroundColor: Colors.transparent,
                onTap: () {
                  provider.resetfields();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (builder) => const ForgotPasswordPage(),
                  //   ),
                  // );
                },
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              text: "Sign In",
              onTap: () async {
                provider.signIn(context);
              },
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                provider.resetfields();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const SignUpPage(),
                  ),
                );
              },
              child: const Text(
                "Not have an account ? Create One",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
