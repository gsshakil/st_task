import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.size = 50,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final loadingIndicator = SpinKitDoubleBounce(
      color: color ?? Theme.of(context).colorScheme.surface,
      size: 50.0,
    );
    return  Center(
      child: loadingIndicator,
    );
  }
}
