import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitExpense () {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <=0) {
      return;
    }

    widget.addTx(
      enteredTitle, 
      enteredAmount
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitExpense(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitExpense(),
                // onChanged: (val) {
                //   amountInput = val;
                // },
              ),
              Container(
                height: 50,
                child: Row(children: <Widget>[
                  Text('No Date Chosen'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Pick Date', style: TextStyle(fontWeight: FontWeight.bold)), 
                    onPressed: () {},
                  )
                ],),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: submitExpense,
              )
            ],
          ),
        ),
      ),
    );
  }
}