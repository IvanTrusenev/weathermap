import 'package:go_router/go_router.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/screen/login/login_screen.dart';
import 'package:weathermap/ui/screen/splash/splash_screen.dart';
import 'package:weathermap/ui/screen/weather/weather_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        path: '/weather',
        builder: (context, state) {
          Map<String, WeatherResponse?> params = state.extra as Map<String, WeatherResponse?>;
          return WeatherScreen(initialResponse: params['InitialResponse']);
        }),
  ],
);
