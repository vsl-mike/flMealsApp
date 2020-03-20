import 'package:flutter/material.dart';
import './category_item_screen.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  void _goToCategoryItemScreen(BuildContext context, String title, String id) {
    Navigator.pushNamed(context, CategoryItemScreen.routeName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recepies'),
      ),
      body: CategoryItem(goToCategoryItemScreen: _goToCategoryItemScreen),
    );
  }
}
