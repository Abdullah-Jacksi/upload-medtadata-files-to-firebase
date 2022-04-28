import 'package:flutter/material.dart';

Future showWarningDialog({required BuildContext context, required bool isError}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:Text(
          isError
              ? "Notice"
              : "Notice",
          textAlign: TextAlign.center,
        ),
        content: Text(
          isError
              ? "There is an error in selecting files"
              : "File data uploeded successfully",
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                  )))
        ],
      );
    },
  );
}
