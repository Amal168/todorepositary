import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebasesurvices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> signinUser(
      BuildContext context, String Username, String Password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: Username, password: Password);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Entered Sccussfullt")));
      }
      return credential;
    } on FirebaseAuthException {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
      }
    } catch (e) {
      print("Error=${e}");
    }
  }

  Future<UserCredential?> createUser(
      BuildContext context, String Username, String Password,) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: Username, password: Password);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Entered Sccussfullt")));
      }
      return credential;
    } on FirebaseAuthException {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
      }
    } catch (e) {
      print("Error=${e}");
    }
  }

  Future<UserCredential?> googlesigninUser(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleUser?.authentication;
      final googlecredential = GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  Future<void> signout() async {
    _auth.signOut();
  }
}

class Firebasestorage {
  Future createData(
      String title, String subtitle,bool checkbox,{String? documentId}) async {
    final ref = await FirebaseFirestore.instance.collection("user");
    return await ref.doc(documentId).set({'title': title, 'subtitle': subtitle,'checkbox':checkbox});
  }

  Future UpdateData(String title, String subtitle,{String? documentId}) async {
    final ref = await FirebaseFirestore.instance.collection("user");
    return await ref
        .doc(documentId)
        .update({'title': title, 'subtitle': subtitle,});
  }

  Future deleteData({String? documentId}) async {
    final ref = await FirebaseFirestore.instance.collection("user");
    return await ref.doc(documentId).delete();
  }
}
