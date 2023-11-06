import 'package:flutter/material.dart';

import 'add_client_page.dart';
import 'client_page.dart';

void main() {
  runApp(const MyAPP2());
}

class MyAPP2 extends StatefulWidget {
  const MyAPP2({super.key});

  @override
  State<MyAPP2> createState() => _MyAPP2State();
}

class _MyAPP2State extends State<MyAPP2> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: [
              Text("list des Clients"),
              Text("Ajouter Client"),
            ][_currentIndex],
          ),
          body: [ClientPage(), AddClientPage()][_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            iconSize: 32,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_view_month), label: 'List'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajouter'),
            ],
          )),
    );
  }
}
