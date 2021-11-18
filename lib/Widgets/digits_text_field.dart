

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// TextField for int numbers.
class DigitsTextField extends StatelessWidget {
  const DigitsTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.suffixText,
    this.contentPadding,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? suffixText;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          suffixText: suffixText,
          contentPadding: contentPadding,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)],
      );
}
