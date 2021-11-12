import 'package:flutter/material.dart';

class HomeViewCurrencyBox extends StatefulWidget {
  final Container? dollarSellPriceTextField;
  final Container? dollarBuyPriceTextField;
  final Container? euroBuyPriceTextField;
  final Container? euroSellPriceTextField;

  const HomeViewCurrencyBox({
    required this.dollarSellPriceTextField,
    required this.dollarBuyPriceTextField,
    required this.euroBuyPriceTextField,
    required this.euroSellPriceTextField,
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewCurrencyBoxState createState() => _HomeViewCurrencyBoxState();
}

class _HomeViewCurrencyBoxState extends State<HomeViewCurrencyBox> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 170.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              widget.dollarBuyPriceTextField as Widget,
                              widget.dollarSellPriceTextField as Widget,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              widget.euroBuyPriceTextField as Widget,
                              widget.euroSellPriceTextField as Widget,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
