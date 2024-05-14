import 'package:flutter/material.dart';
import 'loginphn.dart';
import 'bus1.dart';
import 'bus5.dart';
import 'bus3.dart';
import 'bus4.dart';
import 'bus2.dart';
import 'notification.dart';
class Buslist extends StatelessWidget {
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
                    'Bus list',
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
            icon: Icon(Icons.notification_important, color: Colors.black, size: 30),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => notificationPage()),
            );

            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
           
          },
        ),
      ),
      body: ListView(
        children: [
          buildCard(
              context,
              'Bus 1',
              'Departure time - 6:00 AM \n Route - Changanaserry to College',
              Colors.blue,
              'assets/images/one.png',
              Bus1TrackingScreen()),
              buildCard(
              context,
              'Bus 2',
              'Departure time - 6:00 AM \n Route - Cherthala to College',
              Colors.green,
              'assets/images/two.png',
               Bus2TrackingScreen()),
          buildCard(
              context,
              'Bus 3',
              'Departure time - 6:00 AM \n Route -  Kayamkulam to College',
              Colors.orange,
              'assets/images/three.png',
               Bus3TrackingScreen()),
          buildCard(
              context,
              'Bus 4',
              'Departure time - 6:00 AM \n Route - Thumboly to College',
              Colors.yellow,
              'assets/images/four.png',
               Bus4TrackingScreen()),
          buildCard(
              context,
              'Bus 5',
              'Departure time - 6:00 AM \n Route - Changanassery to College',
              Colors.red,
              'assets/images/five.png',
               Bus5TrackingScreen()),
        ],
      ),
    );
  }

   Widget buildCard(BuildContext context, String title, String subtitle,
      Color cardColor, String? avatarImage, Widget route) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      color: Color.fromARGB(255, 236, 232, 241),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>route),
          );
        },
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: avatarImage != null ? AssetImage(avatarImage) : null,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}





