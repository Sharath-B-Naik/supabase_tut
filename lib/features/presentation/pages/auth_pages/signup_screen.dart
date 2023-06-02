import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/presentation/controller/auth_controller.dart';
import 'package:note_app/widgets/app_button.dart';
import 'package:note_app/widgets/app_text.dart';
import 'package:note_app/widgets/app_text_form_field.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

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
              "Sign Up",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 50),
            AppTextFormField(
              controller: provider.nameController,
              hintText: 'Enter name',
            ),
            const SizedBox(height: 10),
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
            AppTextFormField(
              controller: provider.confirmController,
              hintText: 'Confirm password',
            ),
            const SizedBox(height: 30),
            AppButton(
              text: "Sign Up",
              onTap: () async {
                provider.signUp(context);
              },
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Alreadt have an account ?  Login",
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
