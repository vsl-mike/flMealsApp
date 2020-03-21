import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MealDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, String routeName, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'RobotoCondensed',
            fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 200,
            color: Theme.of(context).accentColor,
            child: Text('Let\'s cook !',
                style: TextStyle(
                  fontSize: 30,
                )),
          ),
          buildListTile('Meals', Icons.restaurant_menu,'/',context),
          buildListTile('Filters', Icons.settings,FiltersScreen.routeName,context),
        ],
      ),
    );
  }
}
