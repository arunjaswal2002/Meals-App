import 'package:flutter/material.dart';
import '../Classes/meals.dart';
import '../widgets/mealItem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitdata = false;
  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitdata) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'] as String;
      displayedMeals = widget.availableMeals.where((meal) {
        //to store all the meals which are included in the particular category
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitdata = true;
    }
    super.didChangeDependencies();
  }

  // void removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(categoryTitle,
                style: Theme.of(context).textTheme.subtitle1)),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
