import 'package:flutter/material.dart';
import './categories_screen.dart';
import './category_item_screen.dart';

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
          canvasColor: Color.fromRGBO(255, 240, 240, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 23,
              )),
        ),
        routes: {
          '/': (ctx) => CategoryScreen(),
          CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(),
        });
  }
}
