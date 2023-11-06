import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp5());
}

class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
