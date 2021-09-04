import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String routeTag;
  final VoidCallback? onPressed;

  const SideMenuButton({
    required this.icon,
    required this.label,
    required this.routeTag,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 65.0),
      // padding: EdgeInsets.all(3.0),
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.purple),
        borderRadius: BorderRadius.circular(3.0),
      ),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          onPrimary: Colors.purple,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          enabledMouseCursor: SystemMouseCursors.click,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 14.0,
              color: Colors.purple,
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 40.0, maxHeight: 11.0),
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  label,
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
