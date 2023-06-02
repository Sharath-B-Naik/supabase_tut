// import 'package:flutter/material.dart';
// import 'package:note_app/features/presentation/providers/auth_provider.dart';
// import 'package:note_app/widgets/app_button.dart';
// import 'package:note_app/widgets/app_text.dart';
// import 'package:note_app/widgets/app_text_form_field.dart';
// import 'package:provider/provider.dart';

// class ForgotPasswordPage extends StatelessWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Consumer<AuthProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const AppText(
//                   "Sign In",
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 const SizedBox(height: 50),
//                 AppTextFormField(
//                   controller: provider.emailController,
//                   hintText: 'Enter email address',
//                 ),
//                 const SizedBox(height: 30),
//                 AppButton(
//                   text: "Send reset email",
//                   onTap: () => provider.forgotPassword(context),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
