import 'package:flutter/material.dart';
import 'package:projet_app/consultant/consultant_page.dart';

import 'add_consultant_page.dart';

void main() {
  runApp(const MyAPP1());
}

class MyAPP1 extends StatefulWidget {
  const MyAPP1({super.key});

  @override
  State<MyAPP1> createState() => _MyAPP1State();
}

class _MyAPP1State extends State<MyAPP1> {
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
            title: [
              Text("list des consultant"),
              Text("Ajouter Consultant")
            ][_currentIndex],
          ),
          body: [ConsultantPage(), AddConsultantPage()][_currentIndex],
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
