import 'package:st_task/core/extensions/build_context_extensions.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

enum FeedbackType { info, success, error, alert }

class FeedBackHelper {
  static showSuccessSnackBar({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    context.showFlash<bool>(
      barrierColor: Colors.black54,
      barrierBlur: 0,
      barrierDismissible: true,
      duration: const Duration(seconds: 2),
      builder: (context, controller) => FlashBar(
        controller: controller,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          side: BorderSide(),
        ),
        clipBehavior: Clip.hardEdge,
        indicatorColor: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.tips_and_updates_outlined),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () => controller.dismiss(true),
              child: const Text('Dismiss').padding(right: 20))
        ],
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    context.showErrorBar<bool>(
      duration: const Duration(seconds: 2),
      content: Text(content).padding(right: 20),
    );
  }

  static showAlertConfirmAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function() onTap,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  context.pop();
                },
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  onTap;
                },
                child: const Text("Yes"),
              ),
            ],
          );
        });
  }

  static void showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          );
        });
  }
}
