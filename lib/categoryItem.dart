import 'package:flutter/material.dart';
import 'AllMealsOfParticularCategory.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key? key}) : super(key: key);
  final String id;
  final String title;
  final Color color;
  CategoryItem({required this.id, required this.title, required this.color});

  void _selectCategoryOfMeal(String id, BuildContext ctx, String title) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategoryOfMeal(id, context, title),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
