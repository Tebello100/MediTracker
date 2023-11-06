import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Screens/DoctorsScreens/doctorProfile.dart';
import 'package:helloworld/Screens/DoctorsScreens/patientsProfile.dart';
import 'package:helloworld/Screens/DoctorsScreens/prescribeMedication.dart';
import 'package:helloworld/Screens/DoctorsScreens/updateDoctorProfile.dart';
import 'package:helloworld/Screens/PatientScreens/messages.dart';
import 'package:helloworld/Screens/PatientScreens/patientProfile.dart';
import 'package:helloworld/Screens/PatientScreens/patientsDetails.dart';
import 'package:helloworld/Screens/PatientScreens/prescriptionHistory.dart';
import 'package:helloworld/Screens/PatientScreens/reminder.dart';
import 'package:helloworld/Screens/PatientScreens/updatePatientProfile.dart';
import 'package:helloworld/Screens/PharmacyScreens/dispenseMedication.dart';
import 'package:helloworld/Screens/PharmacyScreens/pharmaUpdateProfile.dart';
import 'package:helloworld/Screens/PharmacyScreens/pharmacistProfile.dart';
import 'package:helloworld/Screens/PharmacyScreens/prescribedMedication.dart';
import 'package:helloworld/Screens/option.dart';
import 'package:helloworld/homePage.dart';
import 'package:helloworld/resetPassword.dart';
import 'package:helloworld/searchPatient.dart';
import 'package:helloworld/setAlarm.dart';

class RouteManager {
  static const String home = "/"; //Login page
  static const String secondPage = "/secondPage"; //Login options
  static const String doctorPage = "/doctor"; //Doctors profile page
  static const String pharmacistPage = "/pharmacist"; //Pharmacists profile page
  static const String patientPage = "/patient"; //Patients register page
  static const String patientProfile = "/patientProfile"; // Patients Profile
  static const String adminProfile = "/adminProfile";
  static const String updatePatientProfile = "/updatePatientProfile";
  static const String prescriptionHistory = "/prescriptionHistory";
  static const String reminder = "/reminder";
  static const String messages = "/messages";
  static const String updateDoctorProfile = "/updateDoctorProfile";
  static const String viewProfile = "/viewProfile";
  static const String prescribe = "/prescribe";
  static const String pharmaUpdate = "/pharmaUpdate";
  static const String dispense = "/dispense";
  static const String prescribedMedication = "/presribedMedication";
  static const String resetPassword = "/resetPassword";
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String setAlarm = "/setAlarm";
  static const String searchPatient = "/searchPatient";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (context) => Home(
                  auth: _auth,
                  firestore: _firestore,
                ) //Home(auth: null, firestore: null,),
            );
      case secondPage:
        return MaterialPageRoute(
          builder: (context) => Options(
            auth: _auth,
            firestore: _firestore,
          ),
        );
      case patientPage:
        return MaterialPageRoute(
          builder: (context) => PatientsDetails(
            auth: _auth,
            firestore: _firestore,
          ),
        );
      case doctorPage:
        return MaterialPageRoute(
          builder: (context) => const DoctorProfile(),
        );
      case pharmacistPage:
        return MaterialPageRoute(
          builder: (context) => const PharmacistProfile(),
        );
      case patientProfile:
        return MaterialPageRoute(
          builder: (context) => PatientProfile(
            clinicFileNo: '',
            auth: _auth,
            firestore: _firestore,
          ),
        );
      case updatePatientProfile:
        return MaterialPageRoute(
          builder: (context) => const UpdateProfile(),
        );
      case prescriptionHistory:
        return MaterialPageRoute(
          builder: (context) => const PrescriptionHistory(),
        );
      case reminder:
        return MaterialPageRoute(
          builder: (context) => const Reminder(),
        );
      case messages:
        return MaterialPageRoute(
          builder: (context) => const Messages(),
        );
      case updateDoctorProfile:
        return MaterialPageRoute(
          builder: (context) => const UpdateDoctorProfile(),
        );
      case viewProfile:
        return MaterialPageRoute(
          builder: (context) => const ViewProfile(),
        );
      case prescribe:
        return MaterialPageRoute(
          builder: (context) => const Prescribe(),
        );
      case pharmaUpdate:
        return MaterialPageRoute(
          builder: (context) => const PharmaUpdateDetails(),
        );
      case dispense:
        return MaterialPageRoute(
          builder: (context) => const Dispense(),
        );
      case prescribedMedication:
        return MaterialPageRoute(
          builder: (context) => const PrescribedMedication(),
        );
      case resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
        );
      // case setAlarm:
      //   return MaterialPageRoute(
      //     builder: (context) => const SetAlarm(),
      //   );
      case searchPatient:
        return MaterialPageRoute(
          builder: (context) => const SearchPatient(),
        );
      default:
        throw const FormatException("Route not found");
    }
  }
}
