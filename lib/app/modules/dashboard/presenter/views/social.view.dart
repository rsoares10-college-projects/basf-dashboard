import 'package:flutter/material.dart';

class SocialView extends StatefulWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  SocialViewState createState() => SocialViewState();
}

class SocialViewState extends State<SocialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('[Social View]'),
      ),
    );
  }
}
