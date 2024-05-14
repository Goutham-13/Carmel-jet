import 'package:flutter/material.dart';
import 'loginphn.dart';
import 'settings.dart';

class infoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Account Info',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 30),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
           
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    left: 130,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/wallpaper.jpg'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Center(
                       child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            SizedBox(height: 60.0),
            Text(
              'Goutham Krishna',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'gouthamkrishna1318@gmail.com',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
           SizedBox(height: 10),
           ListTile(
                      title: Text('CLASS:  S6 CSE',
                       style: TextStyle( fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Stop:   YMCA Alappuzha',
                       style: TextStyle( fontWeight: FontWeight.bold),), 
                    ),
                       Divider(),
                    ListTile(
                      title: Text('Bus No:   4',
                       style: TextStyle( fontWeight: FontWeight.bold),), 
                    ),
                   
          ],
                  ),
                    ),
                
              ),
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: infoScreen(),
  ));
}