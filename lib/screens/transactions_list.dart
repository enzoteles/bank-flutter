import 'package:bank_flutter/models/contact.dart';
import 'package:bank_flutter/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    transactions.add(Transaction(100.0, Contato(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transaction transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.account.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}


