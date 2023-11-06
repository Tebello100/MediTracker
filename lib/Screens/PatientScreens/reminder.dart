import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

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
                const Text(
                  'Reminder',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.red)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '10:00 AM',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.setAlarm);
                        },
                        child: const Text(
                          "Set Reminder",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            minimumSize: const Size.fromHeight(50),
                            shape: const StadiumBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.patientProfile);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            minimumSize: const Size.fromHeight(50),
                            shape: const StadiumBorder()),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        color: Colors.red,
                        thickness: 5.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Current Reminders',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.patientProfile);
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
