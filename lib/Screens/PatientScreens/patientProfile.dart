import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/getFullNames.dart';
import 'package:helloworld/services/auth.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile(
      {Key? key,
      required this.clinicFileNo,
      required this.auth,
      required this.firestore})
      : super(key: key);
  final String clinicFileNo;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('patients')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.white])),
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                  'Assets/1logo.png',
                ),
                width: 200,
                height: 150,
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage('Assets/Patient.jpg'),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: getDocId(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: docIDs.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title:
                                      GetFullNames(documentId: docIDs[index]),
                                );
                              }));
                        }),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.updatePatientProfile);
                        },
                        child: const Text(
                          'Patient Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.prescriptionHistory);
                        },
                        child: const Text(
                          'Prescription History',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.reminder);
                        },
                        child: const Text(
                          'Consumption Reminder',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.messages);
                        },
                        child: const Text(
                          'Messages',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
