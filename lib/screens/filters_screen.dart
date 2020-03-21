import 'package:flutter/material.dart';
import '../widgets/meal_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName='/filtes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MealDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
