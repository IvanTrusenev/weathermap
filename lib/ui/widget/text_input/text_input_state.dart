import 'package:flutter/material.dart';

class TextInputState {
  TextInputState({
    required this.controller,
    this.placeholder = '',
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;

  void dispose() {
    controller.dispose();
  }

  TextInputState copyWith({
    TextEditingController? controller,
    String? placeholder,
    bool? obscureText,
  }) {
    return TextInputState(
      controller: controller ?? this.controller,
      placeholder: placeholder ?? this.placeholder,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
