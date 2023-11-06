import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddContratPage extends StatefulWidget {
  const AddContratPage({super.key});

  @override
  State<AddContratPage> createState() => _AddContratPageState();
}

class _AddContratPageState extends State<AddContratPage> {
  final _formKey = GlobalKey<FormState>();

  final typeContratController = TextEditingController();
  final nomSociteController = TextEditingController();
  final reglesController = TextEditingController();
  final nomClientController = TextEditingController();
  final nomConsultantController = TextEditingController();
  final dateDebutController = TextEditingController();
  final dateFinController = TextEditingController();
  final addressController = TextEditingController();
  final refMissionController = TextEditingController();
  final tauxController = TextEditingController();
  final tjmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Type de Contrat',
                        hintText: 'entre votre type de contrat',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'Contrat', child: Text("CDI")),
                        DropdownMenuItem(value: 'demo', child: Text("CDD"))
                      ],
                      value: 'Contrat',
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom de Socite',
                        hintText: 'entre votre type de contrat',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'Contrat', child: Text("INSY2S")),
                      ],
                      value: 'Contrat',
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Regles',
                        hintText: 'Entre votre regles',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: reglesController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom Client',
                        hintText: 'Entre votre Nom client',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: nomClientController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom Consultant',
                        hintText: 'Entre votre Nom Consultant',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: nomConsultantController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Date de Debut',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Date de Fin',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
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
                      controller: addressController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Ref Mission',
                        hintText: 'entre votre refMission',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'reference', child: Text("RefM01")),
                        DropdownMenuItem(value: 'demo', child: Text("RefM02")),
                        DropdownMenuItem(
                            value: 'Mission', child: Text("RefM03"))
                      ],
                      value: 'reference',
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Taux',
                        hintText: 'Entre votre taux',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: tauxController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'TJM',
                        hintText: 'Entre votre TJM',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: tjmController,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final typeContrat = typeContratController.text;
                            final nomSocite = nomSociteController.text;
                            final regles = reglesController.text;
                            final nomClient = nomClientController.text;
                            final nomConsultant = nomConsultantController.text;
                            final dateDebut = dateDebutController.text;
                            final dateFin = dateFinController.text;
                            final address = addressController.text;
                            final refMission = refMissionController.text;
                            final taux = tauxController.text;
                            final tjm = tjmController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Envoi en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            //ajout dans la base de donner
                            CollectionReference contratRef = FirebaseFirestore
                                .instance
                                .collection("Contrat");
                            contratRef.add({
                              'typeContrat': typeContrat,
                              'nomSocite': nomSocite,
                              'regles': regles,
                              'nomClient': nomClient,
                              'nomConsultant': nomConsultant,
                              'dateDebut': dateDebut,
                              'dateFin': dateFin,
                              'address': address,
                              'refMission': refMission,
                              'taux': taux,
                              'tjm': tjm,
                              'avatar': "femme",
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
