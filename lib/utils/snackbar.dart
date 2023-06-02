import 'package:flutter/material.dart';
import 'package:note_app/widgets/app_text.dart';

showSnackBar(BuildContext context, {required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.teal,
      content: AppText(
        msg,
        color: Colors.white,
      ),
    ),
  );
}
