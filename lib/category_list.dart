import 'package:flutter/material.dart';
import 'package:foodyz/category_meals_screen.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryList(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(35),
        child: Text(title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
