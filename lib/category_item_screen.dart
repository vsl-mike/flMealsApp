import 'package:flutter/material.dart';
import './meal.dart';
import './dummy_data.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = '/categories_item';
  @override
  Widget build(BuildContext context) {
    final Map arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final List<Meal> meals = DUMMY_MEALS.where(
      (element) {
        if (element.categories.contains(arguments['id'])) return true;
        return false;
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  //height: 100,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Text(
                    meals[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            );
          }),
      // body: Column(
      //   children: meals.map((element) {
      //     return Text(element.title);
      //   }).toList(),
      // ),
    );
  }
}
