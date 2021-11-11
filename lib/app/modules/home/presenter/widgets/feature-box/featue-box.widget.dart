import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String? value;
  final String label;
  final IconData icon;

  FeatureBox({
    required this.value,
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final valueStyle = TextStyle(color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.bold);

  final detailStyle = TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 11.0);

  final labelStyle = TextStyle(color: Colors.white, fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 183.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.5),
        border: Border.all(width: 1.0, color: Colors.deepPurple.shade200),
      ),
      child: value == null
          ? Container(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(maxHeight: 45.0, maxWidth: 45.0),
                child: CircularProgressIndicator(
                  color: Colors.deepPurple.shade200,
                ),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade500,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          icon,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Text(
                                value ?? '',
                                style: valueStyle,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                label,
                                style: labelStyle,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 10.0),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'View Details',
                            style: detailStyle,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Colors.deepPurple,
                            size: 14.0,
                          ),
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
