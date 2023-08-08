import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => ColorBook.button),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((_) => ColorBook.white),
        elevation: MaterialStateProperty.resolveWith<double>((_) => 0),
        minimumSize: MaterialStateProperty.resolveWith<Size?>((_) => Size(double.infinity, 48.h)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
        child: Text(label, style: TextStyleBook.button),
      ),
    );
  }
}
