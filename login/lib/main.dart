import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:login/blocs/GuestBloc/guest_bloc.dart';
import 'package:login/blocs/PropertyBloc/property_bloc.dart';
import 'package:login/blocs/SignUpBloc/signup_bloc.dart';
import 'package:login/blocs/SignInBloc/signin_bloc.dart';

import 'Navigation/AppRoutes.dart';
import 'Navigation/Navigator.dart';
import 'Screens/screens/home_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc()),
        BlocProvider<PropertyBloc>(create: (context) => PropertyBloc()),
        BlocProvider<GuestBloc>(create: (context) => GuestBloc()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: onGenerateRoute,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return HomePage();
          }
      ),
    )
    );
  }
}
