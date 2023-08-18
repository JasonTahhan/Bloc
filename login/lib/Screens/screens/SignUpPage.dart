import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Screens/screens/home_page_screen.dart';
import 'package:login/data/repositories/Auth_Repository.dart';
import '../../blocs/SignUpBloc/signup_bloc.dart';
import '../../blocs/SignUpBloc/signup_event.dart';

class SignUpPage extends StatelessWidget {
  final AuthenticationRepository firebaseHelper = AuthenticationRepository();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    BlocProvider.of<SignUpBloc>(context).add(UpdateFirstNameRequested(firstName));
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
                    BlocProvider.of<SignUpBloc>(context).add(UpdateLastNameRequested(lastName));
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
                    BlocProvider.of<SignUpBloc>(context).add(UpdateEmailRequested(email));
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
                      child: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  onChanged: (password) {
                    BlocProvider.of<SignUpBloc>(context).add(UpdatePasswordRequested(password));
                  },
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<SignUpBloc>(context).add(SignUp());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
