import 'package:flutter/material.dart';

class DashboardType extends StatelessWidget {
  final String dashboardType;
  final bool isSelected;
  final VoidCallback onTap;

  DashboardType(
      {required this.dashboardType,
      required this.isSelected,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          dashboardType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
