import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/presentation/controller/auth_controller.dart';
import 'package:note_app/features/presentation/pages/auth_pages/login_screen.dart';
import 'package:note_app/features/presentation/pages/note_list_page/note_list_page.dart';

import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await di.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authControllerProvider.notifier);

    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      themeMode: ThemeMode.dark,
      home: Builder(
        builder: (context) {
          if (provider.isLoggedIn) {
            return const NotePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
