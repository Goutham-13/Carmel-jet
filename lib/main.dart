import 'package:flutter/material.dart';
import 'loginphn.dart'; 
import 'backend.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(), // Set your login screen as the home screen
    );
  }
}
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  TextEditingController _nameController = TextEditingController();
  String _errorMessage = '';
  String _matchedDocumentId = ''; // Variable to hold matched document ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/icon.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20.0), // Adjust spacing according to your design
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name',
                  prefixIcon: Icon(Icons.verified_user),
                hintText: '+91 81234 56789',
              ),
            ),
                
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  String enteredName = _nameController.text;

                  // Check if the entered name matches any document in Firestore
                  try {
                    final querySnapshot = await FirebaseFirestore.instance.collection('students_details').get();
                    final documents = querySnapshot.docs;
                    bool nameFound = false;

                    for (var document in documents) {
                      if (document.id == enteredName) {
                        
                        setState(() {
                         _matchedDocumentId = enteredName;
                        });
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen(matchedDocumentId: _matchedDocumentId)),
                        
                        );

                        nameFound = true;
                        break;
                      }
                    }

                    if (!nameFound) {
                      setState(() {
                        _errorMessage = 'Entered name is not valid.';
                      });
                    }
                  } catch (e) {
                    print('Error: $e');
                    // Handle error
                  }
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 10.0), // Adjust spacing according to your design
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      // Handle sign up navigation
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
