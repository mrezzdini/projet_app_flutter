import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultantPage extends StatefulWidget {
  const ConsultantPage({super.key});

  @override
  State<ConsultantPage> createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Consultant").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Text("aucun Consultant");
          }
          List<dynamic> consultants = [];
          snapshot.data!.docs.forEach((element) {
            consultants.add(element);
          });

          return ListView.builder(
            itemCount: consultants.length,
            itemBuilder: (context, index) {
              final consultant = consultants[index];
              final avatar = consultant['avatar'].toString().toLowerCase();
              final email = consultant['email'];
              final userName = consultant['userName'];

              return Card(
                child: ListTile(
                  leading: Image.asset("lib/images/$avatar.jpg"),
                  title: Text('$email'),
                  subtitle: Text('$userName'),
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
