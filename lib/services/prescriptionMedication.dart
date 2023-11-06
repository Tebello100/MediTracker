import 'package:cloud_firestore/cloud_firestore.dart';

class MedicationDatabase {
  Future<String> addMedication({
    required String medications,
  }) async {
    try {
      CollectionReference patients =
          FirebaseFirestore.instance.collection("prescribedMedications");

      await patients.doc().set({
        'instructions': medications,
      });
      return 'success';
    } catch (error) {
      return 'Error adding medications';
    }
  }
}
