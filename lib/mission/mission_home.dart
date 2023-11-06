import 'package:flutter/material.dart';

import 'add_mission_page.dart';
import 'mission_page.dart';

void main() {
  runApp(const MyAPP3());
}

class MyAPP3 extends StatefulWidget {
  const MyAPP3({super.key});

  @override
  State<MyAPP3> createState() => _MyAPP3State();
}

class _MyAPP3State extends State<MyAPP3> {
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
              Text("list des Missions"),
              Text("Ajouter Mission"),
            ][_currentIndex],
          ),
          body: [MissionPage(), AddMissionPage()][_currentIndex],
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
