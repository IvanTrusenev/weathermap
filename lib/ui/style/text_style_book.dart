import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/ui/style/color_book.dart';

class TextStyleBook {
  static TextStyle appName = TextStyle(
    color: Colors.white,
    fontFamily: 'Inter-Bold',
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    height: 1.21,
  );

  static TextStyle appNameAdd = TextStyle(
    color: Colors.white,
    fontFamily: 'Inter-Thin',
    fontSize: 24.sp,
    fontWeight: FontWeight.w300,
    height: 1.21,
  );

  static TextStyle h1 = TextStyle(
    color: ColorBook.textColor,
    fontFamily: 'Ubuntu',
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    height: 1.14,
  );

  static TextStyle b2 = TextStyle(
    color: ColorBook.addTextColor,
    fontFamily: 'Roboto',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    height: 1.32,
  );

  static TextStyle placeholder = TextStyle(
    color: ColorBook.addTextColor,
    fontFamily: 'Roboto',
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    height: 1.41,
  );

  static TextStyle textInputLabel = TextStyle(
    color: ColorBook.addTextColor,
    fontFamily: 'SFProText-Regular',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    height: 1.47,
  );

  static TextStyle textInputText = TextStyle(
    color: ColorBook.textColor,
    fontFamily: 'SFProText-Regular',
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    height: 1.41,
    decoration: TextDecoration.none,
    decorationThickness: 0,
  );

  static TextStyle button = TextStyle(
    color: ColorBook.white,
    fontFamily: 'Roboto',
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    height: 1.41,
  );

  static TextStyle airConditionVague = TextStyle(
    color: Colors.white.withOpacity(0.20000000298023224),
    fontSize: 15.sp,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: 1.47,
  );

  static TextStyle airConditionWhite = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.47,
  );

  static TextStyle temperature = TextStyle(
    color: Colors.white,
    fontSize: 64.sp,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w500,
    height: 1.125,
  );

  static TextStyle b1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    height: 1.41,
  );
}
