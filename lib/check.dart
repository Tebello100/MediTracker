import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Screens/option.dart';
import 'package:helloworld/homePage.dart';
import 'package:helloworld/services/auth.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth(auth: _auth).user,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.uid == null) {
              return Home(
                auth: _auth,
                firestore: _firestore,
              );
            } else {
              return Options(
                auth: _auth,
                firestore: _firestore,
              );
            }
          } else {
            return const Scaffold(
              body: Center(child: Text("Loading")),
            );
          }
        });
  }
}
