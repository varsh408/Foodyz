import 'package:flutter/material.dart';
import 'package:foodyz/categories_scrren.dart';
import 'package:foodyz/favorites_Screen.dart';
import 'package:foodyz/main_drawer.dart';
import './models/meal.dart';

class TabsScreenState extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreenState(this.favoriteMeals);
  @override
  _TabsScreenStateState createState() => _TabsScreenStateState();
}

class _TabsScreenStateState extends State<TabsScreenState> {
  List<Map<String, Object>> _pages;
  int selectPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
