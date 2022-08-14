import './widget/user_transactions.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expence planner'),
        backgroundColor: Color.fromARGB(177, 174, 3, 148),
        actions: [
          IconButton(
            onPressed: () {},
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
            UserTransaction(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
