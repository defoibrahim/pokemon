import 'package:flutter/material.dart';

class CommonWidgets {
  Future<bool?> showAlertDialog({
    required BuildContext context,
    required String title,
    String? content,
    String? cancelActionText,
    String defaultActionText = 'OK',
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}
