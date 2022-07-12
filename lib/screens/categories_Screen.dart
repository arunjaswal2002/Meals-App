
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MealsApp')),
        body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //it takes care of how the items are adjusted automatically by taking an input a width of item.
              maxCrossAxisExtent: 200,
              //Child aspect ratio is the height of the item according to the item width i.e. current height is (3/2)*200=300
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: <Widget>[
            ...DUMMY_CATEGORIES
                .map((item) => CategoryItem(
                    id: item.id, title: item.title, color: item.color))
                .toList(),
          ],
        ));
  }
}
