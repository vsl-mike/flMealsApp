import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryItem extends StatelessWidget {
  final Function goToCategoryItemScreen;
  CategoryItem({this.goToCategoryItemScreen});
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((element) {
        return InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () =>
              goToCategoryItemScreen(context, element.title, element.id),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  element.color.withOpacity(0.6),
                  element.color,
                ],
              ),
            ),
            child: Text(
              element.title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          splashColor: Theme.of(context).primaryColor,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
