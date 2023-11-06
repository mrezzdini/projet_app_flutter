import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_app/constants.dart';
import 'package:projet_app/util/dashboard_type.dart';

import '../util/dashboard_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final List dashboardType = [
    [
      'Contrat',
      true,
    ],
    [
      'Consultant',
      false,
    ],
    [
      'Client',
      false,
    ],
    [
      'Mission',
      false,
    ]
  ];
  //user taped
  void dashboardTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < dashboardType.length; i++) {
        dashboardType[i][1] = false;
      }
      dashboardType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      drawer: Constants(),
      appBar: myAppBar,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: Column(children: [
        //trouver les actualitee
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "notre actualite",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),

        SizedBox(height: 25),

        //bar de recherche
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'vasy',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),

        SizedBox(height: 25),
        // horizontale list of dashboard
        Container(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dashboardType.length,
              itemBuilder: (context, index) {
                return DashboardType(
                    dashboardType: dashboardType[index][0],
                    isSelected: dashboardType[index][1],
                    onTap: () {
                      dashboardTypeSelected(index);
                    });
              }),
        ),
        //list view horizontale
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            DashboardTile(
              dashboardImagePath: 'lib/images/contrat1.png',
              dashboardName: 'contrat',
              dashboardTitle: 'jhon wick',
              dashboardNumber: 'N01',
            ),
            DashboardTile(
              dashboardImagePath: 'lib/images/contrat2.jpg',
              dashboardName: 'contrat',
              dashboardTitle: 'thomy shelby',
              dashboardNumber: 'N02',
            ),
            DashboardTile(
              dashboardImagePath: 'lib/images/contrat3.png',
              dashboardName: 'contrat',
              dashboardTitle: 'brad bitt',
              dashboardNumber: 'N03',
            ),
          ],
        ))
      ]),
    );
  }
}
