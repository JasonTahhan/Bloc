import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Navigation/Navigator.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_event.dart';
import 'package:login/data/enum/enum_signin.dart';
import 'package:login/data/repositories/Auth_Repository.dart';
import '../../blocs/SignInBloc/signin_bloc.dart';
import '../../blocs/SignInBloc/signin_event.dart';
import '../../blocs/SignInBloc/signin_state.dart';
import '../shared_widget/Error.dart';

class SignInPage extends StatelessWidget {
  final AuthenticationRepository firebaseHelper = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if(state.signInStatus==SignInStatus.success){
          BlocProvider.of<AuthenticationBloc>(context).add(const UpdateCurrentUser());
        }
         if (state.signInStatus == SignInStatus.error) {
          ErrorSnackbar.showErrorSnackbar(context,'The email or password you entered is INCORRECT.',
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Group 10961.png',
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  'You need to login to complete the booking process',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'MontserratRegular',
                    color: Color(0xFF323E48),
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Container(
                      width: 342.0,
                      height: 48.0,
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Color(0xFFB2BBCA)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                          labelText: 'Email',
                        ),
                        onChanged: (value) {
                          BlocProvider.of<SignInBloc>(context)
                              .add(UpdateEmailRequested(value));
                        },
                      ),
                    ),
                    Container(
                      width: 342.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Color(0xFFB2BBCA)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          BlocProvider.of<SignInBloc>(context)
                              .add(UpdatePasswordRequested(value));
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      print('Forgot Password tapped');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 240),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'MontserratRegular',
                          color: Color(0xFF297BE6),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                Container(
                  width: 342,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<SignInBloc>(context).add(SignIn());
 
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF297BE6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MontserratMedium',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(85, 50, 65, 52),
          child: RichText(
            text: TextSpan(
              text: 'Don’t have an account? ',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'MontserratSemiBold',
                color: Color(0xFF323E48),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'SIGN UP',
                  style: TextStyle(
                    color: Color(0xFF297BE6),
                    fontFamily: 'MontserratSemiBold',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      NavigationService.push('/SignUp');
                      
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
