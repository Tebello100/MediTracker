import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/services/auth.dart';
import 'package:helloworld/services/database_service.dart';

class PatientsDetails extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const PatientsDetails({Key? key, required this.auth, required this.firestore})
      : super(key: key);

  @override
  State<PatientsDetails> createState() => _PatientsDetailsState();
}

class _PatientsDetailsState extends State<PatientsDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _clinicNoController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('MediDetails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Patients' details"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xffefb7b3),
                  Colors.white,
                ])),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  TextFormField(
                    controller: _namesController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Full names",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full names!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Surname",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your surnames!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _clinicNoController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Clinic file number",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your clinic file number!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _mobileNumberController,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Mobile number",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your mobile number!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    //Fix input to recognise email with "@"
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Email address",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email address!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _password2Controller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      hintText: "Re-enter password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please re-enter your password!";
                      }

                      if (value != _password2Controller.text) {
                        return "Passwords must match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final String? value = await Auth(auth: widget.auth)
                          .createAccount(
                              email: _emailController.text,
                              password: _passwordController.text);

                      if (value!.contains('Succesful')) {
                        final result = await FirestoreDatabase().addPatient(
                          fullNames: _namesController.text,
                          surname: _surnameController.text,
                          clinicFileNo: _clinicNoController.text,
                          mobileNumber: _mobileNumberController.text,
                        );

                        if (result.contains('success')) {
                          Navigator.of(context).pushNamed(RouteManager.home);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(result),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    },
                    child: const Text(
                      "Create an account",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size.fromHeight(50),
                        shape: const StadiumBorder()),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteManager.home);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size.fromHeight(50),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
