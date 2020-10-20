import 'package:bank_flutter/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/**
 * method to create database
 * */
Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {
     final String path = join(dbPath, 'bytebanck.dp');
     return openDatabase(path, onCreate: (db, version){
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');
     }, version: 1);
  });
}

Future<int> save(Contato contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.account;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contato>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contato> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contato contact = Contato(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}