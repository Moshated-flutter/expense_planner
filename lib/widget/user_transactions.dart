import 'dart:ffi';

import 'package:flutter/material.dart';
import 'new_transactions.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [];

  void Addtransactions(String txtitle, double txamount) async {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(Addtransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
