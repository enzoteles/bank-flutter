import 'package:bank_flutter/models/contact.dart';
import 'package:bank_flutter/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ListaDeContatos extends StatelessWidget {
  final List<Contato> contacts = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuário'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contato contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContatosForm(),
                ),
              )
              .then((newContato) => debugPrint(newContato.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contato contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.account.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
