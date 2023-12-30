import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool?> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'] ?? false;
    _vegetarian = widget.currentFilter['vegan'] ?? false;
    _lactoseFree = widget.currentFilter['lactose'] ?? false;
    _vegan = widget.currentFilter['vegan'] ?? false;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subTitle, var currentValue,
      Function(bool) updateValue) {
    //Function bool is due to the fact that function is taking a bool value
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  final savedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    '_vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(savedFilters);
                }),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                child: Text('Adjust your meal selection',
                    style: Theme.of(context).textTheme.subtitle1)),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    'Gluten-free',
                    'Enable it to include only gluten-free meals',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free',
                    'Enable it to include only Lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian-food',
                    'Enable it to include only Vegetarian meals',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Enable it to include only Vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
