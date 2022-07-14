import 'package:flutter/material.dart';
import '../Classes/meals.dart';
import '../widgets/mealItem.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
          child:
               Text('You don\'t have any favorites - try to add some!'));
    }
    return ListView.builder(
      itemBuilder: (_, index) {
        return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,);
      },
      itemCount: favoriteMeals.length,
    );
  }
}
