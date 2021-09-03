import 'package:flutter/material.dart';

class SimulatorView extends StatefulWidget {
  const SimulatorView({Key? key}) : super(key: key);

  @override
  SimulatorViewState createState() => SimulatorViewState();
}

class SimulatorViewState extends State<SimulatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('[Simulator]'),
      ),
    );
  }
}
