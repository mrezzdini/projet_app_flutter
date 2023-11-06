import 'package:flutter/material.dart';
import 'package:projet_app/contrat/genrate_page.dart';

import 'add_contrat_page.dart';
import 'contrat_page.dart';

void main() {
  runApp(const MyAPP4());
}

class MyAPP4 extends StatefulWidget {
  const MyAPP4({super.key});

  @override
  State<MyAPP4> createState() => _MyAPP4State();
}

class _MyAPP4State extends State<MyAPP4> {
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
              Text("list des Contrats"),
              Text("Ajouter Contrat"),
              Text("Genere Contrat"),
            ][_currentIndex],
          ),
          body: [
            ContratPage(),
            AddContratPage(),
            GeneratePage(
              title: '',
            )
          ][_currentIndex],
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'acceuil'),
            ],
          )),
    );
  }
}
