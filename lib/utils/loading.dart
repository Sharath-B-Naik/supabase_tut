import 'package:flutter/material.dart';
import 'package:note_app/widgets/app_text.dart';

void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();
void stopLoading(BuildContext context) => Navigator.of(context).pop();

void showLoading(BuildContext context) {
  dismissKeyboard(context);

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                AppText(
                  "Please wait",
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
