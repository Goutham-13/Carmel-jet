import 'package:flutter/material.dart';
import 'loginphn.dart';
import 'main.dart';
import 'navigationbar.dart';

class LoginmailScreen extends StatefulWidget {
  @override
  _LoginmailScreenState createState() => _LoginmailScreenState();
}

class _LoginmailScreenState extends State<LoginmailScreen> {
   final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  bool _isObscure = true;
  bool _saveLoginInfo = false;
  bool _isButtonActive = false;

@override
void initState(){
  super.initState();
  _emailController.addListener(_checkFields);
  _passwordController.addListener(_checkFields); 
}

    void _checkFields() {
    final isFieldsFilled =
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
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

 @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
           onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen ()),
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
                  style: TextStyle(fontFamily:'Raleway',fontSize: 30, fontWeight: FontWeight.bold),
                ),
              TextField(
                 controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'EMAIL ID',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              TextButton(
                onPressed: () {
                
                },
                child: Text('Use phone number instead',
                  style: TextStyle(color: Colors.blue)),
              ),
              TextField(
                 controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
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
                onPressed: () {
                  // Implement password recovery functionality
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
             SizedBox(height: 70),
                ElevatedButton(
                   onPressed: _isButtonActive ? () {
                               Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarLayout (matchedDocumentId: "123",)),
      );
                  }: null,
                 child: Text('Log In',
                    style: TextStyle(fontFamily:'Raleway' ,fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: _isButtonActive
                      ? Colors.black
                      : Color.fromARGB(140, 87, 85, 85),
                ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


