import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loginmail.dart';
import 'main.dart';
import 'buslist.dart';
import 'navigationbar.dart';

class LoginScreen extends StatefulWidget {
  final String matchedDocumentId;

  LoginScreen({required this.matchedDocumentId});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _saveLoginInfo = false;
  bool _isButtonActive = false;
  String? _enteredDocumentName;
  Map<String, dynamic>? _documentData; // Store the entire document data

  final CollectionReference studentsCollection = FirebaseFirestore.instance.collection('students_details');

  @override
  void initState() {
    super.initState();
    _enteredDocumentName = widget.matchedDocumentId;
    _phoneNumberController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
    _fetchDocumentValues(); // Fetch document values when the screen initializes
  }

  // Fetch document values including all fields
  void _fetchDocumentValues() async {
    try {
      final DocumentSnapshot documentSnapshot = await studentsCollection.doc(_enteredDocumentName).get();
      if (documentSnapshot.exists) {
        setState(() {
        _documentData = documentSnapshot.data() as Map<String, dynamic>?;

        });
      }
    } catch (e) {
      print('Error fetching document values: $e');
    }
  }

  void _checkFields() {
    final phoneNumber = _phoneNumberController.text;
    final password = _passwordController.text;

    final isPhoneNumberValid = phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
    final isFieldsFilled = isPhoneNumberValid && password.isNotEmpty;

    if (isFieldsFilled != _isButtonActive) {
      setState(() => _isButtonActive = isFieldsFilled);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _toggleSaveLoginInfo(bool? value) {
    setState(() {
      _saveLoginInfo = value ?? false;
    });
  }

 void _login() async {
  final phoneNumber = _phoneNumberController.text;
  final password = _passwordController.text;

  try {
    final DocumentSnapshot documentSnapshot = await studentsCollection.doc(_enteredDocumentName).get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;

      // Compare the stored phone number and password with the user-entered values
      if (data['Phone Number'] == phoneNumber && data['Password'] == password) {
        // If both phone number and password match, navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarLayout()),
        );
        return;
      }
    }

    // If either phone number or password is incorrect, show invalid credentials dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('The entered mobile number or password is incorrect.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    print('Error: $e');
    // Handle error if any
  }
}



  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(
              'Log In',
              style: TextStyle(fontFamily: 'Raleway', fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Add some spacing
            // Display the document name
          
            // Rest of your code
            TextField(
              controller: _phoneNumberController,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'PHONE NUMBER',
                prefixIcon: Icon(Icons.phone),
                hintText: '+91 81234 56789',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                suffixIcon: IconButton(
                  icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _saveLoginInfo,
                  onChanged: _toggleSaveLoginInfo,
                ),
                Text('Save Login Info on your device'),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot your password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: _isButtonActive ? _login : null,
              child: Text('Log In',
                  style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: _isButtonActive ? Colors.black : Color.fromARGB(140, 87, 85, 85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
