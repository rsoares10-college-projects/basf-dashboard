import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final TextStyle detailStyle;
  final Color detailIconColor;
  final String value;
  final String label;
  final IconData icon;

  const FeatureBox({
    required this.backgroundColor,
    required this.borderColor,
    required this.labelStyle,
    required this.valueStyle,
    required this.detailStyle,
    required this.detailIconColor,
    required this.value,
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100.0, maxWidth: 200.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(width: 0.5, color: borderColor),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        value,
                        style: labelStyle,
                      ),
                      Text(
                        label,
                        style: valueStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 30.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'View Details',
                  style: detailStyle,
                ),
                Icon(
                  Icons.add,
                  color: detailIconColor,
                  size: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
