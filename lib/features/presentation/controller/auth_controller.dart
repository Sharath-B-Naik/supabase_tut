import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/dependency_injection.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';
import 'package:note_app/features/domain/usecases/firebase_usecases.dart';
import 'package:note_app/features/presentation/pages/note_list_page/note_list_page.dart';
import 'package:note_app/services/local_database_service.dart';
import 'package:note_app/utils/loading.dart';
import 'package:note_app/utils/snackbar.dart';

/// RIVERPOD CONTROLLER
final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  return sl.call<AuthController>();
});

final signInFutureProvider =
    FutureProvider.autoDispose((ref) => sl.call<AuthController>());

class AuthController extends ChangeNotifier {
  final FireBaseUseCases useCases;
  final DatabaseService databaseService;

  AuthController({required this.useCases, required this.databaseService}) {
    checkUserLoggedIn();
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<void> checkUserLoggedIn() async {
    final resp = databaseService.getBool('is_loggedin');
    isLoggedIn = resp;
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String get name => nameController.text.trim();
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();
  String get confirm => confirmController.text.trim();

  void resetfields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmController.clear();
  }

  Future<void> signIn(BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      return showSnackBar(context, msg: 'Email & password required');
    }

    final user = UserEntity(
      uid: '',
      name: '',
      password: password,
      email: email,
    );

    try {
      showLoading(context);
      await useCases.signIn(user);
      databaseService.setBool('is_loggedin', true);
      stopLoading(context);
      resetfields();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return const NotePage();
          },
        ),
        (route) => false,
      );

      resetfields();
    } on FirebaseException {
      //
    } catch (e) {
      //
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (name.isEmpty) {
      return showSnackBar(context, msg: 'Name is required');
    }
    if (email.isEmpty) {
      return showSnackBar(context, msg: 'Email is required');
    }
    if (password.isEmpty) {
      return showSnackBar(context, msg: 'Password required');
    }
    if (password != confirm) {
      return showSnackBar(context, msg: 'Password not matched');
    }

    final user = UserEntity(
      uid: '',
      name: name,
      password: password,
      email: email,
    );

    try {
      showLoading(context);
      await useCases.signUp(user);
      databaseService.setBool('is_loggedin', true);
      stopLoading(context);
      resetfields();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return const NotePage();
          },
        ),
        (route) => false,
      );
    } on FirebaseException catch (e) {
      showSnackBar(context, msg: e.message ?? 'Error');
    } catch (e) {
      //
      showSnackBar(context, msg: e.toString());
    }
  }

  Future<void> forgotPassword(BuildContext context) async {
    if (email.isEmpty) {
      return showSnackBar(context, msg: 'Email is required');
    }

    try {
      showLoading(context);
      await useCases.forgotPassword(email);
      stopLoading(context);
      emailController.clear();

      Navigator.of(context).pop();
    } on FirebaseException {
      //
    } catch (e) {
      //
    }
  }
}
