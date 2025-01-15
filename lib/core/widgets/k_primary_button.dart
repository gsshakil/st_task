import 'package:flutter/material.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/widgets/loading_indicator.dart';

class KPrimaryButton extends StatelessWidget {
  const KPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 60,
    this.icon,
    this.outlineColor,
    this.borderOpacity = 1,
    this.isLoading = false,
  });

  final String title;
  final Function()? onPressed;
  final double height;
  final Widget? icon;
  final Color? outlineColor;
  final double borderOpacity;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: height,
        child: Center(
          child: isLoading
              ? const LoadingIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null ? icon!.padding(right: 10) : const SizedBox(),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                          .bold(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
