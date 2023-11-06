import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);

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
                    image: AssetImage('Assets/Doctor.jpg'),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Hello Dr Smith',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.updateDoctorProfile);
                        },
                        child: const Text(
                          'Doctor\'s profile',
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
                              .pushNamed(RouteManager.viewProfile);
                        },
                        child: const Text(
                          "View patient's profile",
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
                              .pushNamed(RouteManager.prescribe);
                        },
                        child: const Text(
                          'Prescribe Medication',
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteManager.home);
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: const StadiumBorder(),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
