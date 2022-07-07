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
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: const TextStyle(
                  fontSize: 24, fontFamily: 'RobotoCondensed'))),
      home: const CategoriesScreen(),
    );
  }
}
