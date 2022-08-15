import 'package:expence_planner/widget/new_transactions.dart';

import './widget/transactions_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'expence planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void Addtransactions(String txtitle, double txamount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        amount: txamount,
        title: txtitle,
        date: DateTime.now());
    setState(
      () {
        _userTransactions.add(newtx);
      },
    );
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransactions(Addtransactions),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expence planner'),
        backgroundColor: Color.fromARGB(177, 174, 3, 148),
        actions: [
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Card(
                child: Text(
                  'chart',
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                ),
                elevation: 5,
                color: Color.fromARGB(255, 222, 135, 239),
              ),
              width: double.infinity,
              height: 35,
            ),
            TransactionList(_userTransactions),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
