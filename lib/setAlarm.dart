import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/services/auth.dart';

class SetAlarm extends StatefulWidget {
  @override
  State<SetAlarm> createState() => _SetAlarmState();
  late final FirebaseAuth auth;
  late final FirebaseFirestore firestore;
}

class _SetAlarmState extends State<SetAlarm> {
  // creating text ediiting controller to take hour
  TextEditingController hourController = TextEditingController();

  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.white])),
          child: Column(children: <Widget>[
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Show Alarms',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
              onPressed: () async {
                final String? signOutValue =
                    await Auth(auth: widget.auth).signOut();

                if (signOutValue == "Successful") {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(signOutValue!)));
                  Navigator.of(context).pushNamed(RouteManager.home);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(signOutValue!)));
                }
              },
              child: const Text(
                'Log out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(50)),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.secondPage);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(50)),
            ),
          ])),
    );
  }
}
