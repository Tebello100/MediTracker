import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/services/auth.dart';

class PharmacistProfile extends StatefulWidget {
  const PharmacistProfile(
      {Key? key, required this.auth, required this.firestore})
      : super(key: key);
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  @override
  State<PharmacistProfile> createState() => _PharmacistProfileState();
}

class _PharmacistProfileState extends State<PharmacistProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.white])),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    'Assets/1logo.png',
                  ),
                  width: 200,
                  height: 150,
                ),
                const Row(
                  children: [
                    Image(
                      image: AssetImage('Assets/Pharmacist.jpg'),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Pharmacy',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.pharmaUpdate);
                        },
                        child: const Text(
                          'Pharmacist Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.dispense);
                        },
                        child: const Text(
                          'Dispense medication',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.prescribedMedication);
                        },
                        child: const Text(
                          'Prescribed Medication',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        final String? signOutValue =
                            await Auth(auth: widget.auth).signOut();

                        if (signOutValue == "Successful") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(signOutValue!)));
                          Navigator.of(context).pushNamed(RouteManager.home);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(signOutValue!)));
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
                        Navigator.of(context)
                            .pushNamed(RouteManager.secondPage);
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
