import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List <Transaction> transactions = [
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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Price'),
                    controller: amountController,
                    // onChanged: (val) {
                    //   amountInput = val;
                    // },
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.lightGreen,
                    onPressed: () {
                      print(titleController.text);
                    },
                  )
                ],
              ),
            ),
          ),
          Column (children: transactions.map((tx) {
            return Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                  child: Text(
                    '\$${tx.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightGreen
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date)
                    )
                ],)
              ],
            );
          }).toList(),)
        ]
      ,)
    );
  }
}