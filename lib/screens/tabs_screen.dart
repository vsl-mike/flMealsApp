import 'package:flutter/material.dart';
import '../widgets/meal_drawer.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  TabsScreen(this.favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

int _currentPageIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  @override
  void initState() {
    pages = [
      {'widget': CategoryScreen(), 'title': 'Categories'},
      {'widget': FavoritesScreen(widget.favoritesMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void selectTab(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_currentPageIndex]['title']),
      ),
      body: pages[_currentPageIndex]['widget'],
      drawer: MealDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => selectTab(index),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
