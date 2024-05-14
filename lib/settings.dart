import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loginphn.dart';
import 'accountinfo4.dart';
import 'medicalinfo4.dart';

class SettingsScreen extends StatefulWidget {
  final String matchedDocumentId;

  final Map<String, dynamic> documentData;
  SettingsScreen({required this.matchedDocumentId, required this.documentData});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _enteredDocumentName;
  Map<String, dynamic>? _documentData;

  final CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('students_details');

  @override
  void initState() {
    super.initState();
    _enteredDocumentName = widget.matchedDocumentId;
    _fetchDocumentValues();
  }

  void _fetchDocumentValues() async {
    print("value in ");
    print(_enteredDocumentName);
    try {
      final DocumentSnapshot documentSnapshot =
          await studentsCollection.doc(_enteredDocumentName).get();
      if (documentSnapshot.exists) {
        setState(() {
          _documentData = documentSnapshot.data() as Map<String, dynamic>;
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching document values: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _documentData == null // Check if document data is null
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator if data is null
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 32,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => infoScreen()),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -20,
                                left: 230,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/images/wallpaper.jpg'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _documentData?['Name'] ??
                                          'Name not available',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Reg No: ${_documentData?['Reg No'] ?? 'Reg No not available'}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Display other fields in the document
                      ..._documentData!.entries.map((entry) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            title: Text(entry.key),
                            subtitle: Text(entry.value.toString()),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // void main() {
  //   runApp(MaterialApp(
  //     home: SettingsScreen(
  //       matchedDocumentId: '_enteredDocumentName',
  //       documentData: <String, dynamic>{},
  //     ),
  //   ));
  // }
}
