import 'package:bank_flutter/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ListaDeContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuário'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Enzo',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ContatosForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
