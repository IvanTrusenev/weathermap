import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends ChangeNotifier {
  void goWeather(BuildContext context) => context.go('/weather');
}
