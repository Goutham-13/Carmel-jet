import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double _amount = 0.0;
  String _note = '';

  void _updateAmount(String newAmount) {
    setState(() {
      _amount = double.tryParse(newAmount.replaceAll(',', '')) ?? 0.0;
    });
  }

  void _updateNote(String newNote) {
    setState(() {
      _note = newNote;
    });
  }

  void _processPayment() {
    // Implement payment processing logic here
    print('Payment processed successfully!');
    // You can navigate to a success screen or show a confirmation dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                // Add more functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Add report functionality
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'Paying Carmel College of Engineering and Technology',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        


SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹',
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
              SizedBox(width: 5),
              Container(
                width: 130,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: NumberFormat.currency(locale:'en_IN',symbol: '').format(_amount),
                    hintStyle: TextStyle(fontSize: 45),
                    border: InputBorder.none,
                  ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: _updateAmount,
              style: TextStyle(fontSize: 45),
            ),
          ),
            ],
          ),
         SizedBox(height: 20),
        TextField(
              decoration: InputDecoration(
                hintText: 'Add a Note',
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              onChanged: _updateNote,
            ),
          
        
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
  ));
}*/




class CollegeBusFareScreen extends StatelessWidget {
  final List<Map<String, dynamic>> fareList = [
    {'distance': 8, 'fare': 5000},
    {'distance': 10.5, 'fare': 5500},
    {'distance': 13, 'fare': 6000},
    {'distance': 15.5, 'fare': 6500},
    {'distance': 18, 'fare': 7000},
    {'distance': 20.5, 'fare': 7500},
    {'distance': 23, 'fare': 8000},
    {'distance': 25.5, 'fare': 8500},
    {'distance': 28, 'fare': 9000},
    {'distance': 30.5, 'fare': 9500},
    {'distance': 33, 'fare': 10000},
    {'distance': 35.5, 'fare': 10500},
    {'distance': 38, 'fare': 11000},
    {'distance': 40.5, 'fare': 11500},
    {'distance': 43, 'fare': 12000},
    {'distance': 45.5, 'fare': 12500},
    {'distance': 48, 'fare': 13000},
    {'distance': 50.5, 'fare': 13500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Fees'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Distance (in km)')),
              DataColumn(label: Text('Fare Price (\₹)')),
            ],
            rows: fareList
                .map(
                  (fare) => DataRow(
                    cells: [
                      DataCell(Text('${fare['distance']}')),
                      DataCell(Text('${fare['fare']}')),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CollegeBusFareScreen(),
  ));
}
