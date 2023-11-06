import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class PharmaUpdateDetails extends StatelessWidget {
  const PharmaUpdateDetails({Key? key}) : super(key: key);

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
                const Text(
                  'Update your details',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('Assets/Pharmacist.jpg'),
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Full names",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Surname",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  //keyboardType
                  decoration: const InputDecoration(
                    hintText: "Mobile number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Email address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.pharmacistPage);
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size.fromHeight(50),
                      shape: const StadiumBorder()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
