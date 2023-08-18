import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_event.dart';


import '../../data/repositories/Auth_Repository.dart';
import 'home_page_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }
    });
    initializeFirebase();
    context.read<AuthenticationBloc>().add(UpdateCurrentUser());

  }
@override
  void dispose() {
    super.dispose();
  }

  Future<void> initializeFirebase() async {
    try {
      AuthenticationRepository firebaseService = AuthenticationRepository();
      
      await firebaseService.initializeFirestoreCollection();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } catch (e) {
      print('Error initializing Firebase and Firestore collection: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
