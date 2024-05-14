import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AppDatabase {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<void> saveData(String key, String value) async {
    DatabaseReference ref = _database.reference().child('students_data').child(key);
    await ref.set(value);
  }

  Future<Map<String, dynamic>> getData(String key) async {
    DatabaseReference ref = _database.reference().child('students_data').child(key);
    DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
    return snapshot.value as Map<String, dynamic>;
  }
}
