import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import './chart_bar.dart';


class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day && 
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
              totalSum += recentTransactions[i].price;
            }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1), 
        'amount': totalSum
      };
    });
  }

  double get maxSpent {
    return groupedTransactions.fold(0.0, (sum, index) {
      return sum + index['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'], 
                data['amount'], 
                maxSpent == 0.0 ? 0.0 : (data['amount'] as double) / maxSpent,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}