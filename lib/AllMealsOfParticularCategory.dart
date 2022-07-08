import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String title;
  // CategoryMealsScreen(this.categoryId,this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String categoryTitle = routeArgs['title'] as String;
    final String categoryId = routeArgs['id'] as String;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId );
    }).toList();
    return Scaffold(
        appBar: AppBar(
            title: Text(categoryTitle,
                style: Theme.of(context).textTheme.subtitle1)),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return Text(
              categoryMeals[index].title,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
