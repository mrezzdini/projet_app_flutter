import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final prenomController = TextEditingController();
  final raisonsocialController = TextEditingController();
  final siretNameController = TextEditingController();
  final nomcontactController = TextEditingController();
  final telNumberController = TextEditingController();
  final responsabiliteNameController = TextEditingController();
  final addressNameController = TextEditingController();

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
                      controller: prenomController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Raisonsocial',
                        hintText: 'Entre votre RaisonSocial',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: raisonsocialController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Siret',
                        hintText: 'Entre votre Nom siret',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: siretNameController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom Contact',
                        hintText: 'Entre votre Nom contact',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: nomcontactController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Telphone',
                        hintText: 'Entre votre Telphone',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: telNumberController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Responsabilite',
                        hintText: 'Entre votre Nom Responsabilite',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: responsabiliteNameController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Adress',
                        hintText: 'Entre votre Adress',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: addressNameController,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final email = emailController.text;
                            final Prenom = prenomController.text;
                            final RaisonSocial = raisonsocialController.text;
                            final Siret = siretNameController.text;
                            final NomContact = nomcontactController.text;
                            final Telphone = telNumberController.text;
                            final Responsabilite =
                                responsabiliteNameController.text;
                            final Address = addressNameController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Envoi en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            //ajout dans la base de donner
                            CollectionReference clientRef =
                                FirebaseFirestore.instance.collection("Client");
                            clientRef.add({
                              'email': email,
                              'prenom': Prenom,
                              'raisonSocial': RaisonSocial,
                              'siret': Siret,
                              'nomcontact': NomContact,
                              'tel': Telphone,
                              'responsabilite': Responsabilite,
                              'address': Address,
                              'avatar': "homme",
                            });
                          }
                        },
                        child: Text("Ajouter")),
                  )
                ],
              ),
            )));
  }
}
