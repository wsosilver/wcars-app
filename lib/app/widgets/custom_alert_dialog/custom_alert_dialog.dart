import 'package:wcars/app/widgets/custom_alert_dialog/types/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:wcars/app/widgets/custom_alert_dialog/types/error_dialog.dart';

import 'types/confirm_dialog.dart';

class CustomAlertDialog {
  static Future<void> error(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        error: error,
      ),
    );
  }

  static Future<void> success(
      {required BuildContext context,
      String? title,
      required String message,
      required Function onActionButton}) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
          title: title, message: message, onClickButton: onActionButton),
    );
  }

  static Future<void> info(BuildContext context, String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => InfoDialog(title: title, message: message),
    );
  }
}
