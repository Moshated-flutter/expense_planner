import 'package:expence_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleTx;

  TransactionList(this.transactions, this.deleTx);
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
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 4,
                    ),
                    elevation: 5,
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 32,
                          backgroundColor: Theme.of(context).primaryColorDark,
                          child: FittedBox(
                            child: Padding(
                              child: Text(
                                '\T ${tx.amount}',
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        title: Text(
                          tx.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            deleTx(tx.id);
                          },
                          icon: Icon(Icons.delete),
                          color: Color.fromARGB(255, 241, 168, 163),
                        )),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
