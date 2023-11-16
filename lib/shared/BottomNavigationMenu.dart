import 'package:flutter/material.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: (int value) {}, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tab 1"),
      BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: "Tab 2"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Tab 3")
    ]);
  }
}
