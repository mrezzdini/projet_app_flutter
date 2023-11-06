import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContratPage extends StatefulWidget {
  const ContratPage({super.key});

  @override
  State<ContratPage> createState() => _ContratPageState();
}

class _ContratPageState extends State<ContratPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Contrat").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Text("aucun Contrat");
          }
          List<dynamic> contrats = [];
          snapshot.data!.docs.forEach((element) {
            contrats.add(element);
          });

          return ListView.builder(
            itemCount: contrats.length,
            itemBuilder: (context, index) {
              final contrat = contrats[index];
              final avatar = contrat['avatar'].toString().toLowerCase();
              final typeContrat = contrat['typeContrat'];
              final nomConsultant = contrat['nomConsultant'];

              return Card(
                child: ListTile(
                  leading: Image.asset("lib/images/$avatar.png"),
                  title: Text('$typeContrat'),
                  subtitle: Text('$nomConsultant'),
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
