import 'package:flutter/material.dart';
import './dummy_data.dart';
import './category_list.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(30),
      children: DUMMY_CATEGORIES
          .map((catdata) =>
              CategoryList(catdata.id, catdata.title, catdata.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
