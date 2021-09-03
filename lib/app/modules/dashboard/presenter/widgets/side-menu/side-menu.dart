import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => Modular.to.navigate('/dashboard/home'),
            child: Text('Home'),
          ),
          ElevatedButton(
            onPressed: () => Modular.to.navigate('/dashboard/simulator'),
            child: Text('Simulator'),
          ),
          ElevatedButton(
            onPressed: () => Modular.to.navigate('/dashboard/about'),
            child: Text('about'),
          ),
        ],
      ),
    );
  }
}
