import 'package:flutter/material.dart';

class RouteNotFoundWidget extends StatelessWidget {
  const RouteNotFoundWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('No route defined for $title')),
    );
  }
}
