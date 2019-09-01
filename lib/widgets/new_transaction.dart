import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitExpense () {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <=0) {
      return;
    }
    
    addTx(
      enteredTitle, 
      enteredAmount
    );
  }

  NewTransaction(this.addTx);

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
                onSubmitted: (_) => submitExpense,
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitExpense,
                // onChanged: (val) {
                //   amountInput = val;
                // },
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.lightGreen,
                onPressed: submitExpense,
              )
            ],
          ),
        ),
      ),
    );
  }
}