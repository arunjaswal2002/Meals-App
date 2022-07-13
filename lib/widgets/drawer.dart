import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData i, VoidCallback f) {
    return ListTile(
        leading: Icon(i, size: 25),
        title: Text(title,
            style: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        onTap: f);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text('Cooking up!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor))),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
