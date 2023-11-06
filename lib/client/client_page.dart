import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Client").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Text("aucun Client");
          }
          List<dynamic> clients = [];
          snapshot.data!.docs.forEach((element) {
            clients.add(element);
          });

          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              final avatar = client['avatar'].toString().toLowerCase();
              final email = client['email'];
              final prenom = client['prenom'];

              return Card(
                child: ListTile(
                  leading: Image.asset("lib/images/$avatar.png"),
                  title: Text('$email'),
                  subtitle: Text('$prenom'),
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
