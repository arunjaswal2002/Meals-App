import 'package:flutter/material.dart';
import 'package:mealsapp/categories_page.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  // const MealsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily:'Raleway',
      ),
      home: const CategoriesScreen(),
    );
  }
}
