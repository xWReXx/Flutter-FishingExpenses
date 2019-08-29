import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Chubby Chernobyl #16',
      price: 2.99,
      date: DateTime.now()  
    ),
    Transaction(
      id: 't2',
      title: 'Amy\'s Ant #16',
      price: 3.99,
      date: DateTime.now()  
    ) 
  ];

  void _addNewTransaction(String txTitle, double txPrice) {
    final newTxt = Transaction(
      title: txTitle, 
      price: txPrice, 
      date: DateTime.now(), 
      id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTxt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
      
    );
  }
}