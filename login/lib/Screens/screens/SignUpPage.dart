import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Navigation/Navigator.dart';
import 'package:login/data/repositories/Auth_Repository.dart';
import '../../blocs/AuthenticationBloc/authentication_bloc.dart';
import '../../blocs/AuthenticationBloc/authentication_event.dart';
import '../../blocs/SignUpBloc/signup_bloc.dart';
import '../../blocs/SignUpBloc/signup_event.dart';
import '../../blocs/SignUpBloc/signup_state.dart';
import '../../data/enum/enum_signup.dart';
import '../shared_widget/Error.dart';

class SignUpPage extends StatelessWidget {
  final AuthenticationRepository firebaseHelper = AuthenticationRepository();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
         if(state.signUpStatus==SignUpStatus.success){
         BlocProvider.of<AuthenticationBloc>(context).add(UpdateCurrentUser());
          NavigationService.push('/home');

        }
         if (state.signUpStatus == SignUpStatus.error) {
          ErrorSnackbar.showErrorSnackbar(context,'Unable to SignUp',
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(66, 80, 66, 35),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'MontserratMedium',
                      color: Color(0xFF323E48),
                    ),
                  ),
                ),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      border: InputBorder.none,
                      labelText: 'First Name',
                    ),
                    onChanged: (firstName) {
                      BlocProvider.of<SignUpBloc>(context)
                          .add(UpdateFirstNameRequested(firstName));
                    },
                  ),
                ),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      border: InputBorder.none,
                      labelText: 'Last Name',
                    ),
                    onChanged: (lastName) {
                      BlocProvider.of<SignUpBloc>(context)
                          .add(UpdateLastNameRequested(lastName));
                    },
                  ),
                ),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      border: InputBorder.none,
                      labelText: 'Email',
                    ),
                    onChanged: (email) {
                      BlocProvider.of<SignUpBloc>(context)
                          .add(UpdateEmailRequested(email));
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      border: InputBorder.none,
                      labelText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _isPasswordVisible = !_isPasswordVisible;
                        },
                        child: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    onChanged: (password) {
                      BlocProvider.of<SignUpBloc>(context)
                          .add(UpdatePasswordRequested(password));
                    },
                  ),
                ),
                SizedBox(height: 32.0),
                Container(
                width: 342.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xFF297BE6),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<SignUpBloc>(context).add(SignUp());
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
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
                    ),
                  );
                }
              }
