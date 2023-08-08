import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              ColorBook.gradientStart,
              ColorBook.gradientEnd,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
              left: 43.w,
              top: 292.h,
              child: Text('WEATHER\nSERVICE', style: TextStyleBook.appName),
            ),
            Padding(
              padding: EdgeInsets.only(top: 694.h),
              child: Text('dawn is coming soon', style: TextStyleBook.appNameAdd),
            ),
          ],
        ),
      ),
    );
  }
}
