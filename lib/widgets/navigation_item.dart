
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({ required this.title, required this.icon, required this.widget});
  final String title;
  final IconData icon;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => widget),

        );

      },
    );
  }
}