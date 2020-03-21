import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final double heightOfCard;
  final Meal meal;
  final Function mealComplexity;
  final Function mealAffordability;
  final Function getMealScreen;
  MealItem(
      {this.heightOfCard,
      this.mealAffordability,
      this.mealComplexity,
      this.meal,
      this.getMealScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getMealScreen(context, meal),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 15,
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.all(10),
                      color: Colors.black38,
                      child: Text(
                        meal.title,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontFamily: 'Raleway'),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.av_timer),
                        SizedBox(
                          width: 5,
                        ),
                        Text(meal.duration.toString()),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          mealAffordability(meal.affordability),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.restaurant),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          mealComplexity(meal.complexity),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
