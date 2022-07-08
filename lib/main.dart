import 'package:flutter/material.dart';
import 'package:mealsapp/categories_Screen.dart';
import 'AllMealsOfParticularCategory.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  // const MealsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontFamily: 'Raleway'),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: const CategoriesScreen(),
      routes: {
        '/': (_) => CategoriesScreen(), //default route is '/' 
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
      },
    );
  }
}
