import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildDrawerItem(context),
    ));
  }

  List<Widget> buildDrawerItem(BuildContext context) {
    final List<String> menuTitles = ["Menu 1", "Menu 2", "Menu 3", "Menu 4"];

    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          textAlign: TextAlign.center,
          "Ace Taxi",
          style: TextStyle(fontSize: 30, color: Colors.white),
        )));

    for (int i = 0; i < menuTitles.length; i++) {
      Widget screen = Container();

      menuItems.add(ListTile(
        title: Text(menuTitles[i],
            style: TextStyle(fontSize: 15, color: Colors.black)),
        onTap: () {
          switch (menuTitles[i]) {
            case 'Menu 1':
              break;
            case 'Menu 2':
              break;
            default:
              break;
          }

          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }

    return menuItems;
  }
}
