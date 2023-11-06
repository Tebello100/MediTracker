import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  TextEditingController queryController = TextEditingController();
  late Stream<QuerySnapshot> results;

  @override
  void initState() {
    super.initState();
    results = FirebaseFirestore.instance
        .collection('patients')
        .where('fullNames', isEqualTo: queryController.text)
        .snapshots();

    queryController.addListener(() {
      results = FirebaseFirestore.instance
          .collection('patients')
          .where('fullNames', isEqualTo: queryController.text)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: queryController,
            decoration: const InputDecoration(
              hintText: 'Search patient',
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: results,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final patients = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    final patient = patients[index];
                    return ListTile(title: Text(patient['fullNames']));
                  });
            },
          ))
        ],
      ),
    );
  }
}
