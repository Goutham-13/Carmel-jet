import 'package:flutter/material.dart';
import 'package:ksrtc/accountinfo4.dart';
import 'loginphn.dart';
import 'accountinfo4.dart';
import 'medicalinfo4.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                // Account Card
                GestureDetector(
       onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => infoScreen  ()),
      );
    },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -20,
                          left: 230,
                          child: CircleAvatar(
                            radius: 50,
                             backgroundImage: AssetImage('assets/images/wallpaper.jpg'), 
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Goutham Krishna',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Reg No: CMA21CS032',
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
                // Notification Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: ListTile(
                    leading: Icon(Icons.notifications, color: Colors.blue),
                    title: Text('Notification'),
                    subtitle: Text('Statusbar and DND'),
                  ),
                  ),
              SizedBox(height: 15),
                // Features Cards
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.security, color: Colors.green),
                        title: Text('Security and Privacy'),
                        subtitle: Text('Data security and privacy settings'),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                         Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MedicalInfo4Screen()),
      );
                        },
                      child: ListTile(
                        leading:Icon(Icons.warning, color: Colors.red),
                        title: Text('Safety and Emergency'),
                        subtitle: Text('Medical info and alerts'),
                      ),
                  ),
                  ],
                  ),
                ),
                               SizedBox(height: 15),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.feedback, color: Color.fromARGB(255, 255, 230, 0)),
                      title: Text('Feedback and Support'),
                      subtitle: Text('Get in touch with us for assistance or to provide feedback'),
                    ),
                     Divider(),
                    ListTile(
                      leading: Icon(Icons.notes_outlined, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Legal information'),
                      subtitle: Text('Review the terms and conditions and our privacy policy'),
                    ),
                    Divider(),
                     ListTile(
                        leading: Icon(Icons.privacy_tip, color: Colors.orange),
                        title: Text('About'),
                        subtitle: Text('Data and permissions'),
                      ),
                  ],
                ),
              ),
            SizedBox(height: 15),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.blue),
                  title: Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Sign out of your account'),
                  onTap: () {
                    
             
                 },
                ),
              )

              
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsScreen(),
  ));
}
