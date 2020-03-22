import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_item_screen.dart';
import './models/meal.dart';
import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availbleMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegetarian': false,
    'isVegan': false,
  };
  void _setFilters(Map<String, bool> userFilters) {
    setState(() {
      _filters['isGlutenFree'] = userFilters['isGlutenFree'];
      _filters['isLactoseFree'] = userFilters['isLactoseFree'];
      _filters['isVegetarian'] = userFilters['isVegetarian'];
      _filters['isVegan'] = userFilters['isVegan'];
      _availbleMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['isGlutenFree']) return false;
        if (!meal.isLactoseFree && _filters['isLactoseFree']) return false;
        if (!meal.isVegetarian && _filters['isVegetarian']) return false;
        if (!meal.isVegan && _filters['isVegan']) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
          ),
          primaryColor: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 240, 240, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 23,
              )),
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(
                listMeals: _availbleMeals,
              ),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        });
  }
}
