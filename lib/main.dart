import 'package:flutter/material.dart';
import 'package:foodyz/categories_scrren.dart';
import 'package:foodyz/category_meals_screen.dart';
import 'package:foodyz/dummy_data.dart';
import 'package:foodyz/filters_screen.dart';
import 'package:foodyz/meal_deatils_screen.dart';
import 'package:foodyz/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegeterian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritMeals = [];
  void _setFilters(Map<String, bool> filterdata) {
    _filters = filterdata;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (_filters['vegeterian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorite(String mealID) {
    final existingIndex = _favoritMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoritMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealID),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritMeals.any((meal) => meal.id == id); //returns true
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreenState(_favoritMeals),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDeatailsScreen.routeName: (ctx) =>
              MealDeatailsScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
