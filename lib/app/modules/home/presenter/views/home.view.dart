import 'package:flutter/material.dart';

import '../widgets/feature-box/feature-box-list.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.deepPurple.shade300,
                  height: 1.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 7,
                  child: FeatureBoxList(),
                ),
                Expanded(
                  flex: 25,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
