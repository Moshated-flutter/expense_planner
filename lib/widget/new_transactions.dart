import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addtxs;

  NewTransactions(this.addtxs);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titlecon = TextEditingController();
  DateTime? selectedDate = null;
  final amountcon = TextEditingController();
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((datepicked) {
      if (datepicked == null) {
        return;
      }
      setState(() {
        selectedDate = datepicked;
      });
    });
  }

  void submitdata() {
    final enteredTitle = titlecon.text;
    final enteredamount = double.parse(amountcon.text);
    if (enteredTitle.isEmpty || enteredamount <= 0 || selectedDate == null) {
      return;
    }
    widget.addtxs(
      titlecon.text,
      double.parse(amountcon.text),
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'title',
              iconColor: Theme.of(context).primaryColor,
            ),
            controller: titlecon,
            onSubmitted: (_) => submitdata(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.number,
            controller: amountcon,
            onSubmitted: (_) => submitdata(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'no date chosen'
                        : DateFormat.yMd().format(selectedDate!),
                    style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
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
