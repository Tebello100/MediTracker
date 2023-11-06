import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/services/auth.dart';

class Home extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Home({Key? key, required this.auth, required this.firestore})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        child: Form(
          child: Column(
            children: [
              const Image(
                image: AssetImage("Assets/1logo.png"),
                height: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  errorStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Please enter your email",
                  hintStyle: TextStyle(fontSize: 20),
                  icon: Icon(Icons.email, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  errorStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Please enter your password",
                  hintStyle: TextStyle(fontSize: 20),
                  icon: Icon(Icons.password, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () async {
                  final String? value = await Auth(auth: widget.auth).signIn(
                      email: _emailController.text,
                      password: _passwordController.text);

                  if (value == "Successful") {
                    _emailController.clear();
                    _passwordController.clear();
                    Navigator.of(context).pushNamed(RouteManager.secondPage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(value!),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.resetPassword);
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.redAccent, fontSize: 18),
                ),
              ),
              const SizedBox(height: 40),
              const Text("Don't have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.patientPage);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: const StadiumBorder(),
                    minimumSize: const Size.fromHeight(50),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
