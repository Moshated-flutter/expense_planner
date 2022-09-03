import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double prcAmount;

  ChartBar(this.label, this.spendingAmount, this.prcAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Card(
            child: Text('T ${spendingAmount.toStringAsFixed(1)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 55,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 202, 2),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: prcAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Card(
          child: Text(label),
        ),
      ],
    );
  }
}
