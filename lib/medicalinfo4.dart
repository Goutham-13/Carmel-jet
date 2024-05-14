import 'package:flutter/material.dart';
import 'settings.dart';
import 'medicalinfoedit.dart';

class MedicalInfo4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Info'),
        actions: [
          /*IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicalInfoEditScreen()),
            );
            },
          ),*/
        ],
         leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
           
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Goutham Krishna',
                           style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
            
                Divider(),
               SizedBox(width: 10),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                     Icons.bloodtype_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Blood group:',
                          style: TextStyle(
                            fontSize: 18,
                           color: Colors.grey,
                          ),
                        ),
                        Text(
                          'B+',
                          style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                 
                   Divider(),
               SizedBox(width: 10),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                     Icons.block_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Allergies:',
                          style: TextStyle(
                            fontSize: 18,
                           color: Colors.grey,
                          ),
                        ),
                        Text(
                          'No allergies',
                          style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                 Divider(),
               SizedBox(width: 10),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                     Icons.location_on_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Address:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Thekkummuri House \n Sanathanam Ward \n Alappuzha',
                           style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
               Divider(),
               SizedBox(width: 10),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                     Icons.handshake_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Organ doner:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'No',
                           style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ]
        ),
              ],
      )
              ],
    ),
              ]
    ),
              ]
          ),
    ),
      ),
    ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MedicalInfo4Screen(),
  ));
}