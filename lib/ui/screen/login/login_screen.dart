import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weathermap/repository/local/database.dart';
import 'package:weathermap/ui/screen/login/login_view_model.dart';
import 'package:weathermap/ui/style/text_style_book.dart';
import 'package:weathermap/ui/widget/button_custom/button_custom.dart';
import 'package:weathermap/ui/widget/text_input/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(
        database: context.read<Database>(),
      ),
      child: Builder(
        builder: (BuildContext context) {
          final UserCredential? userCredential = context.select((LoginViewModel viewModel) => viewModel.userCredentials);
          if (userCredential != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<LoginViewModel>().goWeather(context);
            });
          }

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                // systemOverlayStyle: const SystemUiOverlayStyle(
                //   // Status bar color
                //   statusBarColor: Colors.red,
                //   // Status bar brightness (optional)
                //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
                // ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 48.h),
                      child: Text('Вход', style: TextStyleBook.h1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Text('Введите данные для входа', style: TextStyleBook.b2),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: const _Login(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: const _Password(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 48.h),
                      child: ButtonCustom(
                        label: 'Войти',
                        onPressed: context.read<LoginViewModel>().signIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LoginViewModel>().loginCubit,
      child: const TextInputField(),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LoginViewModel>().passwordCubit,
      child: const TextInputField(enableObscureText: true),
    );
  }
}
