import 'package:flutter/material.dart';
import 'package:login/Screens/screens/SignUpPage.dart';
import '../Screens/screens/SignInPage.dart';
import '../Screens/screens/home_page_screen.dart';
import '../Screens/screens/loading_screen.dart';


class AppRoutes {
  static const String loading = '/';
  static const String home = '/home';
  static const String signin = '/SignIn';
  static const String signup = '/SignUp';
}


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.signin:
      return MaterialPageRoute(builder: (_) => SignInPage());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignUpPage());
    default:
      return MaterialPageRoute(builder: (_) => LoadingScreen());
  }
}
