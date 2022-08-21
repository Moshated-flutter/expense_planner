import 'package:expence_planner/models/transaction.dart';
import 'package:expence_planner/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTrx;
  Chart(this.recentTrx);
  List<Map<String, Object>> get gruopTrxValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0;
        for (var i = 0; i < recentTrx.length; i++) {
          if (recentTrx[i].date.day == weekDay.day &&
              recentTrx[i].date.month == weekDay.month &&
              recentTrx[i].date.year == weekDay.year) {
            totalSum += recentTrx[i].amount;
          }
        }

        return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
      },
    );
  }

  double get totalSpending {
    return gruopTrxValues.fold(0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: gruopTrxValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'].toString(),
                  (data['amount'] as double),
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
