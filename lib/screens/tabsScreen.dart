import 'package:flutter/material.dart';
import './categories_Screen.dart';
import './favoritesScreen.dart';
import '../widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) { 
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: const Text('Meals App'),
                bottom: const TabBar(tabs: <Widget>[
                  Tab(icon: Icon(Icons.category), text: 'Categories'),
                  Tab(icon: Icon(Icons.star), text: 'Favorites')
                ])),
            drawer: MainDrawer(),
            body: const TabBarView(
                children: <Widget>[CategoriesScreen(), FavoritesScreen()])));
  }
}
