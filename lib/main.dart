import 'package:expensive_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //final List<Transaction> transactions = [

  // ];
  @override
 _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

final List<Transaction> _userTransactions = [
  Transaction(
    id: 't1',
    title: 'New Shoes',
    amount: 69.99,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't2',
    title: 'Weekly Groceries',
    amount: 16.53,
    date: DateTime.now(),
  ),
];

void _addNewTransaction(String txTitle, double txAmount) {
  final newTx =
  Transaction(title: txTitle,
    amount: txAmount,
    date: DateTime.now(),
    id: DateTime.now().toString(),
  );

  setState((){
    _userTransactions.add(newTx);
  });
}

void _startAddNewTransaction(BuildContext ctx){
  showModalBottomSheet(context: ctx,
      builder: (_){
    return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
    behavior: HitTestBehavior.opaque,);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(onPressed:() => _startAddNewTransaction(context),
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(child:
      Column(
        //    mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Text('CHART!'),
              ),
              elevation: 5,
            ),
          ),
            TransactionList(_userTransactions),
        ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child:
      Icon(Icons.add), onPressed: () => _startAddNewTransaction(context)),
    );
  }


}
