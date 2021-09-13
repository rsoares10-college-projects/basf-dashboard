import 'package:flutter/material.dart';

class Currencyview extends StatefulWidget {
  const Currencyview({Key? key}) : super(key: key);

  @override
  CurrencyviewState createState() => CurrencyviewState();
}

class CurrencyviewState extends State<Currencyview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('[Currency View]'),
      ),
    );
  }
}
