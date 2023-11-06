import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddConsultantPage extends StatefulWidget {
  const AddConsultantPage({super.key});

  @override
  State<AddConsultantPage> createState() => _AddConsultantPageState();
}

class _AddConsultantPageState extends State<AddConsultantPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Entre votre email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois completer le texte";
                    }
                    return null;
                  },
                  controller: emailController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    hintText: 'Entre votre Nom',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois completer le texte";
                    }
                    return null;
                  },
                  controller: nameController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Prenom',
                    hintText: 'Entre votre Prenom',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois completer le texte";
                    }
                    return null;
                  },
                  controller: firstNameController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom Utilisateur',
                    hintText: 'Entre votre Nom d/utilisateur',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois completer le texte";
                    }
                    return null;
                  },
                  controller: userNameController,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final name = nameController.text;
                        final firstName = firstNameController.text;
                        final userName = userNameController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Envoi en cours...")));
                        FocusScope.of(context).requestFocus(FocusNode());
                        //ajout dans la base de donner
                        CollectionReference consultantRef =
                            FirebaseFirestore.instance.collection("Consultant");
                        consultantRef.add({
                          'email': email,
                          'name': name,
                          'firstName': firstName,
                          'userName': userName,
                          'avatar': "aymen",
                        });
                      }
                    },
                    child: Text("Ajouter")),
              )
            ],
          )),
        ));
  }
}
