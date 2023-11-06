import 'package:helloworld/Models/prescriptionHistory.dart';
import 'package:helloworld/Models/reminder.dart';

class PatientProfile {
  PrescriptionHistory prescriptionHistory;
  Reminder reminderTime;

  PatientProfile({
    required this.prescriptionHistory,
    required this.reminderTime,
  });
}
