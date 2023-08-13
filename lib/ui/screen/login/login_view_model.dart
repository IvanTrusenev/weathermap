import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weathermap/ui/widget/text_input/text_input_cubit.dart';

class LoginViewModel extends ChangeNotifier {
  TextInputCubit get loginCubit => _loginCubit;
  final TextInputCubit _loginCubit = TextInputCubit(placeholder: 'Email');

  TextInputCubit get passwordCubit => _passwordCubit;
  final TextInputCubit _passwordCubit = TextInputCubit(
    placeholder: 'Пароль',
    obscureText: true,
  );

  UserCredential? get userCredentials => _userCredentials;
  UserCredential? _userCredentials;

  String get errorMessage => _errorMessage;
  String _errorMessage = '';

  Future<void> signIn() async {
    try {
      _userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginCubit.state.controller.text,
        password: _passwordCubit.state.controller.text,
      );
      _errorMessage = '';
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong password provided for that user.';
      }
      notifyListeners();
    }
  }

  void goWeather(BuildContext context) => context.go('/weather');
}
