import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialize Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Connection Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Connection Test'),
        ),
        body: Center(
          child: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Firebase is initializing
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Error occurred during Firebase initialization
                return Text('Failed to connect to Firebase');
              } else {
                // Firebase initialization completed successfully
                return Text('Successfully connected to Firebase');
              }
            },
          ),
        ),
      ),
    );
  }
}
