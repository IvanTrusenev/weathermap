import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';
import 'package:weathermap/ui/widget/text_input/text_input_cubit.dart';
import 'package:weathermap/ui/widget/text_input/text_input_state.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    this.enableObscureText = false,
  });

  final bool enableObscureText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputCubit, TextInputState>(builder: (context, state) {
      return TextFormField(
        controller: state.controller,
        decoration: InputDecoration(
          labelText: state.placeholder,
          labelStyle: TextStyleBook.textInputLabel,
          // hintText: state.placeholder,
          hintStyle: TextStyleBook.placeholder,
          // isDense: true,
          contentPadding: EdgeInsets.zero,
          suffixIcon: enableObscureText
              ? _ObscureTextSwitcher(obscureText: state.obscureText, onTap: context.read<TextInputCubit>().invertObscureText)
              : null,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBook.focusedDivider, width: 2.h)),
          border: UnderlineInputBorder(borderSide: BorderSide(color: ColorBook.unfocusedDivider, width: 1.h)),
        ),
        style: TextStyleBook.textInputText,
        obscureText: state.obscureText,
        cursorWidth: 1.w,
        cursorHeight: 18.h,
        cursorColor: Colors.red,
      );
    });
  }
}

class _ObscureTextSwitcher extends StatelessWidget {
  const _ObscureTextSwitcher({
    required this.obscureText,
    required this.onTap,
  });

  final bool obscureText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    late final Widget obscureTextImage;
    if (obscureText) {
      obscureTextImage = SvgPicture.asset(
        'assets/images/eye-off.svg',
        width: 24,
        height: 24,
        fit: BoxFit.scaleDown,
      );
    } else {
      obscureTextImage = SvgPicture.asset(
        'assets/images/eye.svg',
        width: 24,
        height: 24,
        fit: BoxFit.scaleDown,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: obscureTextImage,
    );
  }
}
