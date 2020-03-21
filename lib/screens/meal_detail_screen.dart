import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals_detail_screen';

  Widget buildText(String text) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildScrollList(BuildContext context, Color color, Widget child) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
        
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildText('Ingredients'),
            buildScrollList(
              context,
              Colors.white,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Text(
                      meal.ingredients[index],
                      //style: ,
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildText('Steps'),
            buildScrollList(
              context,
              Colors.white,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            radius: 30,
                            child: Text(
                              '# ' + (index + 1).toString(),
                            ),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        index != meal.steps.length - 1
                            ? Divider(
                                thickness: 1,
                              )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
