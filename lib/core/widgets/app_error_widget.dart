import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.errorMessage,
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
