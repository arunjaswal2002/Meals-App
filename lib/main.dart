
import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/screens/filterScreen.dart';
import 'package:mealsapp/screens/inputPage.dart';
import 'screens/AllMealsOfParticularCategory.dart';
import './screens/mealDetails.dart';
import './screens/tabsScreen.dart';
import 'Classes/meals.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> filter = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void setFilter(Map<String, bool> filterData) {
    setState(() {
      filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filter['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filter['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filter['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filter['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealID);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          hintColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1:
                  const TextStyle(color: Colors.blue, fontFamily: 'Raleway'),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: const CategoriesScreen(),
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals), //default route is '/'
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        FilterScreen.routeName: (_) => FilterScreen(filter, setFilter),
        InputPage.routeName: (_) => InputPage(),
      },
    );
  }
}
