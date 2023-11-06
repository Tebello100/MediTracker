import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  Future<String> addPatient({
    required String fullNames,
    required String surname,
    required String clinicFileNo,
    required String mobileNumber,
  }) async {
    try {
      CollectionReference patients =
          FirebaseFirestore.instance.collection("patients");

      await patients.doc(clinicFileNo).set({
        'fullNames': fullNames,
        'surname': surname,
        'cilinicFileNo': clinicFileNo,
        'mobileNumber': mobileNumber,
      });
      return 'success';
    } catch (error) {
      return 'Error adding user';
    }
  }

  // Future<String?> getUserPatient(String clinicFileNo) async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final User user = _auth.currentUser!;
  //final uid = user.uid;
  //return null;

  // try {
  //   final String uid = FirebaseAuth.instance.currentUser!.uid;
  //   CollectionReference users =
  //       FirebaseFirestore.instance.collection('patients');
  //   final snapshot = await users.doc(clinicFileNo).get();
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return data['fullNames'];
  // } catch (error) {
  //   return 'Error fetching user';
  // }
}
