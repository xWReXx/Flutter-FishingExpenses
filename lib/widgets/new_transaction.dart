import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitExpense () {
    if (_titleController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle, 
      enteredAmount,
      _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker () {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                controller: _titleController,
                onSubmitted: (_) => _submitExpense(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitExpense(),
                // onChanged: (val) {
                //   amountInput = val;
                // },
              ),
              Container(
                height: 50,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null ? 
                      'No Date Chosen' : 
                      'Picked Dat: ${DateFormat.yMMMd().format(_selectedDate)}'
                    )
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Pick Date', style: TextStyle(fontWeight: FontWeight.bold)), 
                    onPressed: _presentDatePicker,
                  )
                ],),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _submitExpense,
              )
            ],
          ),
        ),
      ),
    );
  }
}