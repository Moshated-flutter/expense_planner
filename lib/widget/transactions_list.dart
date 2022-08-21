import 'package:expence_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  'empty',
                  textScaleFactor: 1.2,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.scaleDown,
                  ),
                  height: 300,
                  width: 300,
                ),
              ],
            )
          : Container(
              child: Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 0.5,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          child: Text(
                            'T ${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Text(
                                tx.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              elevation: 3,
                            ),
                            Text(
                              DateFormat().format(tx.date),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
