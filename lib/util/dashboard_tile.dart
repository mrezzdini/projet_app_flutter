import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String dashboardImagePath;
  final String dashboardName;
  final String dashboardTitle;
  final String dashboardNumber;

  DashboardTile({
    required this.dashboardImagePath,
    required this.dashboardName,
    required this.dashboardTitle,
    required this.dashboardNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(dashboardImagePath),
            ),
            // object name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dashboardName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    dashboardTitle,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dashboardNumber,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.favorite),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
