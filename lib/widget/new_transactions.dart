import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addtxs;
  final titlecon = TextEditingController();
  final amountcon = TextEditingController();
  NewTransactions(this.addtxs);
  void submitdata() {
    final enteredTitle = titlecon.text;
    final enteredamount = double.parse(amountcon.text);
    if (enteredTitle.isEmpty || enteredamount <= 0) {
      return;
    }
    addtxs(
      titlecon.text,
      double.parse(amountcon.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            controller: titlecon,
            onSubmitted: (_) => submitdata(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.number,
            controller: amountcon,
            onSubmitted: (_) => submitdata(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            onPressed: submitdata,
            child: Text(
              'add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}