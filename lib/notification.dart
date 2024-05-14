import 'package:flutter/material.dart';
import'buslist.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: notificationPage(),
    );
  }
}

class notificationPage extends StatefulWidget {
  @override
  _notificationPageState createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Buslist ()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
         
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset(
                    'assets/images/panda.gif',
                    width: 400,
                    height: 400,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No notification yet',
                    style: TextStyle(fontSize: 20,color: Colors.purple),
                  ),
                 
                  Text(
                    'Stay turned! Notifications about your activity will show up here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,color: Colors.purple),
                  ),
                ],
              ),
            ),
          
        ],
      ),
    );
  }
}