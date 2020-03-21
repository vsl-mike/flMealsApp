import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_item_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
        });
  }
}
