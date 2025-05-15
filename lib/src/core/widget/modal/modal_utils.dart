import 'package:akgamarra_app/src/core/widget/modal/custom_modal_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showCustomModal({
  required BuildContext context,
  required String title,
  required Widget content,
  required List<Widget> actions,
}) {
  return showDialog(
    context: context,
    builder: (_) {
      return CustomModalDialog(
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}
