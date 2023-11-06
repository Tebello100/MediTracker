import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class Dispense extends StatefulWidget {
  const Dispense({Key? key}) : super(key: key);

  @override
  State<Dispense> createState() => _DispenseState();
}

class _DispenseState extends State<Dispense> {
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage(
                      'Assets/1logo.png',
                    ),
                    width: 200,
                    height: 150,
                  ),
                  const Text(
                    'Send Collection Info',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 15,
                        ),
                        hintText: "Message",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cannot send message with this field empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(RouteManager.pharmacistPage);
                        }
                      },
                      child: const Text(
                        "Send Message",
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
        ),
      ),
    );
  }
}
