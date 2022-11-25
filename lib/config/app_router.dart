import 'package:flutter/material.dart';
import '/models/models.dart';
import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case EdtScreen.routeName:
        return EdtScreen.route(edt: settings.arguments as Edt);
      case GrillaScreen.routeName:
        return GrillaScreen.route(
            ucurricular: settings.arguments as UCurricular);
      case EnUsoScreen.routeName:
        return EnUsoScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case StaticsScreen.routeName:
        return StaticsScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case TermsScreen.routeName:
        return TermsScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
