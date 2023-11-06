import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddMissionPage extends StatefulWidget {
  const AddMissionPage({super.key});

  @override
  State<AddMissionPage> createState() => _AddMissionPageState();
}

class _AddMissionPageState extends State<AddMissionPage> {
  final _formKey = GlobalKey<FormState>();

  final clientController = TextEditingController();
  final consultantController = TextEditingController();
  final refMissionController = TextEditingController();
  final contratDateController = TextEditingController();
  final tjmController = TextEditingController();
  final nbController = TextEditingController();
  final tauxController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

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
                        labelText: 'Client',
                        hintText: 'Entre votre nom de Client',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: clientController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Consultant',
                        hintText: 'Entre votre nom de Consultant',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: consultantController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'RefMission',
                        hintText: 'Entre votre Ref Mission',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: refMissionController,
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
                        labelText: 'Mission Date',
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nb',
                        hintText: 'Entre votre Nb',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "tu dois completer le texte";
                        }
                        return null;
                      },
                      controller: nbController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Taux',
                        hintText: 'Entre votre Taux',
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
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Start Date',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
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
                        labelText: 'End Date',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final client = clientController.text;
                            final consultant = consultantController.text;
                            final refMission = refMissionController.text;
                            final contratDate = contratDateController.text;
                            final tjm = tjmController.text;
                            final nb = nbController.text;
                            final taux = tauxController.text;
                            final startDate = startDateController.text;
                            final endDate = endDateController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Envoi en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            //ajout dans la base de donner
                            CollectionReference missionRef = FirebaseFirestore
                                .instance
                                .collection("Mission");
                            missionRef.add({
                              'client': client,
                              'consultant': consultant,
                              'refMission': refMission,
                              'contratDate': contratDate,
                              'tjm': tjm,
                              'nb': nb,
                              'taux': taux,
                              'startDate': startDate,
                              'endDate': endDate,
                              'avatar': 'homme'
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
