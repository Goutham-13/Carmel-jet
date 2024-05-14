import 'package:flutter/material.dart';
import 'buslist.dart';
import 'payment.dart';
import 'settings.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BottomNavigationBarLayout(
//         matchedDocumentId: "122",
//       ),
//     );
//   }
// }

class BottomNavigationBarLayout extends StatefulWidget {
  final String matchedDocumentId;
  BottomNavigationBarLayout({required this.matchedDocumentId});

  @override
  _BottomNavigationBarLayoutState createState() =>
      _BottomNavigationBarLayoutState();
}

class _BottomNavigationBarLayoutState extends State<BottomNavigationBarLayout> {
  int _selectedIndex = 0;

  List<Widget> _screens = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      Buslist(),
      CollegeBusFareScreen(),
      SettingsScreen(
        matchedDocumentId: widget.matchedDocumentId,
        documentData: <String, dynamic>{},
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Bus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold), // Size of selected label
        unselectedLabelStyle: TextStyle(fontSize: 16),
        onTap: _onItemTapped,
      ),
    );
  }
}
