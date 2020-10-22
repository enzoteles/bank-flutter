import 'package:bank_flutter/database/app_database.dart';
import 'package:bank_flutter/screens/contacts_list.dart';
import 'package:bank_flutter/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() => runApp(ByteBank());



class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home: Dashboard()
    );
  }
}

