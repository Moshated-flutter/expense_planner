import 'package:expence_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  double totalSum = 0;
  List<Transaction> recentTrx;
  Chart(this.recentTrx);
  List<Map<String, Object>> get gruopTrxValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        for (var i = 0; i < recentTrx.length; i++) {
          if (recentTrx[i].date.day == weekDay.day &&
              recentTrx[i].date.month == weekDay.month &&
              recentTrx[i].date.year == weekDay.year) {
            totalSum += recentTrx[i].amount;
          }
          print(DateFormat.E().format(weekDay));
          print(totalSum);
        }
        return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [],
      ),
      margin: EdgeInsets.all(2),
    );
  }
}
