import 'package:cloud_firestore/cloud_firestore.dart';

class InstructionsDatabase {
  Future<String> addInstruction({
    required String instructions,
  }) async {
    try {
      CollectionReference patients =
          FirebaseFirestore.instance.collection("doctorsInstructions");

      await patients.doc().set({
        'instructions': instructions,
      });
      return 'success';
    } catch (error) {
      return 'Error adding instructions';
    }
  }
}
