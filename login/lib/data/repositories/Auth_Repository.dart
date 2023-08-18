import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/data/Models/UserModel.dart';

class AuthenticationRepository {
    
Future<void> AddToFirestore({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        UserModel userModel = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          userId: user.uid,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
      }
      
    } catch (e) {
      print('Error adding to firestore');
    }
  }

  Future<void> initializeFirestoreCollection() async {
    try {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
      QuerySnapshot snapshot = await collectionReference.limit(1).get();
      
      if (snapshot.size > 0) {
        print('Firestore collection already exists.');
      } else {
        print('Firestore collection does not exist or is empty.');
      }
    } catch (e) {
      print('Error initializing Firestore collection: $e');
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error during login: $e');
      throw e; 
    }
  }

  void signOutUser()  {
      FirebaseAuth.instance.signOut();
    }
  }


