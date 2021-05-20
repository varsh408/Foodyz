import 'package:flutter/material.dart';
import './models/meal.dart';
import 'meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  FavoritesScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites, add some !!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            title: favoritesMeal[index].title,
            imageUrl: favoritesMeal[index].imageUrl,
            duration: favoritesMeal[index].duration,
            affordability: favoritesMeal[index].affordability,
            complexity: favoritesMeal[index].complexity,
          );
        },
        itemCount: favoritesMeal.length,
      );
    }
  }
}
