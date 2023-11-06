import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Mission").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Text("aucun Mission");
          }
          List<dynamic> missions = [];
          snapshot.data!.docs.forEach((element) {
            missions.add(element);
          });

          return ListView.builder(
            itemCount: missions.length,
            itemBuilder: (context, index) {
              final mission = missions[index];
              final avatar = mission['avatar'].toString().toLowerCase();
              final refMission = mission['refMission'];
              final taux = mission['taux'];

              return Card(
                child: ListTile(
                  leading: Image.asset("lib/images/$avatar.png"),
                  title: Text('$refMission'),
                  subtitle: Text('$taux'),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
