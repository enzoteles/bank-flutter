

import 'package:bank_flutter/database/app_database.dart';
import 'package:bank_flutter/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const _tableName = 'contacts';
  static const _id = 'id';
  static const _name= 'name';
  static const _accountNumber = 'account_number';

  Future<int> save(Contato contact) async{
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.account;
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contato>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    final List<Contato> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contato contact = Contato(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

}