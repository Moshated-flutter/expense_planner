import 'package:expence_planner/widget/chart.dart';
import 'package:expence_planner/widget/new_transactions.dart';
import './widget/transactions_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'expense planner',
      theme: ThemeData(
        textTheme:
            GoogleFonts.barlowCondensedTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.lightGreen,
      ),
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
  List<Transaction> get _recTrx {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
        backgroundColor: Theme.of(context).primaryColorDark,
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
            Chart(_recTrx),
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
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
