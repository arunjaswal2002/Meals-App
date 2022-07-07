

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key? key}) : super(key: key);
  final String title;
  final Color color;
  CategoryItem({required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
