import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  final Function _toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this._toggleFavorite, this.isFavorite);
  Widget detailTitle(BuildContext context, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1));
  }

  Widget box(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMealDetails =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
        appBar: AppBar(title: Text('${selectedMealDetails.title}')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedMealDetails.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              detailTitle(context, 'Ingredients'),
              box(ListView.builder(
                itemBuilder: (_, index) {
                  return Card(
                      color: Theme.of(context).hintColor,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedMealDetails.ingredients[index])));
                },
                itemCount: selectedMealDetails.ingredients.length,
              )),
              detailTitle(context, 'Steps'),
              box(
                ListView.builder(
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(child: Text('#${index + 1}')),
                            title: Text(selectedMealDetails.steps[index],
                                style: Theme.of(context).textTheme.bodyText1)),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMealDetails.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(isFavorite(mealID) ? Icons.star : Icons.star_border),
            onPressed: () {
              _toggleFavorite(mealID);
            }));
  }
}
