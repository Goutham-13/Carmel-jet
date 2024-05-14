import 'package:flutter/material.dart';
import'buslist.dart';
import 'bus5map.dart';

class Bus3TrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [ 
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/three.png'), // Replace with actual bus avatar image
            ),
            SizedBox(width: 10),
            Text('Bus 3'),
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh action
            },
          ),
        ],
     
leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Buslist()),
            );
          },
        ),
      ),
            body: JourneyRoute(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         
        },
        label: Text('Live Track the Bus'),
        icon: Icon(Icons.directions_bus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class JourneyRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 31,
            child: Container(
              height: 570,
              width: 5,
              color: Colors.grey,
            ),
          ),
          // Display the stops
          Positioned(
            top: 30,
            left: 24,
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StopWidget(name: 'Ochira', isSource: true, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: ' Kayamkulam', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'Karuvatta', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'Thottapaly', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'Ambalappuzha', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'Purakkad', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'Vandanam', isSource: false, isDestination: false),
                SizedBox(height: 60), // Adjust this value as needed
                StopWidget(name: 'College', isSource: false, isDestination: true),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StopWidget extends StatelessWidget {
  final String name;
  final bool isSource;
  final bool isDestination;

  StopWidget({required this.name, required this.isSource, required this.isDestination});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSource ? Colors.green : isDestination ? Colors.red : Colors.grey,
          ),
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Bus3TrackingScreen(),
  ));
}
