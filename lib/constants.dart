import 'package:flutter/material.dart';
import 'package:projet_app/client/client_home.dart';
import 'package:projet_app/consultant/consultant_home.dart';
import 'package:projet_app/contrat/contrat_home.dart';
import 'package:projet_app/fichie_paie/main-m.dart';
import 'package:projet_app/mission/mission_home.dart';

import 'pages/home_page.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: const Text(' '),
  centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);

class Constants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'aymen',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: const Text('aymen@gmail.com',
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'lib/images/logo-3.jpg',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text('C O N S U L T A N T'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAPP1()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('C L I E N T'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAPP2()));
            },
          ),
          ListTile(
            leading: Icon(Icons.description_outlined),
            title: Text('M I S S I O N'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAPP3()));
            },
          ),
          ListTile(
            leading: Icon(Icons.description_outlined),
            title: Text('F A C T U R E'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp6()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text('D E M A N D E'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.control_camera_outlined),
            title: Text('C O N T R A T'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAPP4()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('P A R A M E T R E'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Q U I T T E'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
