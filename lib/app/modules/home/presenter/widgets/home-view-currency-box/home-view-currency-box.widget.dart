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
  final _textFieldLabelStyle = TextStyle(
    fontSize: 12,
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 90.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Preço Dólar',
                style: _textFieldLabelStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 240.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: widget.dollarBuyPriceTextField as Widget),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: widget.dollarSellPriceTextField as Widget),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Preço Euro',
                style: _textFieldLabelStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 240.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: widget.euroBuyPriceTextField as Widget),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: widget.euroSellPriceTextField as Widget),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
