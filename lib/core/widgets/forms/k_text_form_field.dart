import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function()? onEditingComplete;

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? hintText;
  final TextInputAction? inputAction;
  final EdgeInsets contentPadding;
  final FocusNode? focusNode;
  final int maxLines;

  const KTextFormField(
      {super.key,
      required this.controller,
      this.prefixIcon,
      this.validator,
      this.keyboardType = TextInputType.name,
      this.onTap,
      this.onEditingComplete,
      this.suffixIcon,
      this.numberFormatters = false,
      this.obscureText = false,
      this.hintText,
      this.inputAction,
      this.maxLines = 1,
      this.focusNode,
      this.contentPadding = const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      this.readOnly = false});
  final bool obscureText, numberFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.25)),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.225)),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        readOnly: readOnly,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        maxLines: maxLines,
        obscureText: obscureText,
        textInputAction: inputAction,
        keyboardType: keyboardType,
        inputFormatters: [
          if (numberFormatters)
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
      ),
    );
  }
}
