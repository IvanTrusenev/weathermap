import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/ui/widget/text_input/text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit({
    required String placeholder,
    bool obscureText = false,
  }) : super(TextInputState(
          controller: TextEditingController(),
          placeholder: placeholder,
          obscureText: obscureText,
        ));

  @override
  Future<void> close() async {
    state.dispose();
    super.close();
  }

  void invertObscureText() => emit(state.copyWith(obscureText: !state.obscureText));
}
