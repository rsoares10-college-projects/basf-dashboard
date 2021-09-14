import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final TextStyle detailStyle;
  final Color detailIconColor;
  final String? value;
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(width: 0.5, color: borderColor),
      ),
      child: value == null
          ? Container(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
                child: CircularProgressIndicator(
                  color: Colors.deepPurple.shade200,
                ),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 10.0),
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
                          size: 35.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              value ?? '',
                              style: valueStyle,
                            ),
                            Text(
                              label,
                              style: labelStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 30.0),
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 10.0),
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
                        Icons.info_outline_rounded,
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
