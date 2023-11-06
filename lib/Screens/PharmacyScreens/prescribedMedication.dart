import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class PrescribedMedication extends StatelessWidget {
  const PrescribedMedication({Key? key}) : super(key: key);

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
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text(
                  'Prescribed Medication(s)',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.pharmacistPage);
                    },
                    child: const Text(
                      "Back",
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
    );
  }
}
