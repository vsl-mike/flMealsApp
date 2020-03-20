import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final double heightOfCard;
  final List<Meal> meals;
  final int index;
  final Function mealComplexity;
  final Function mealAffordability;
  final Function getMealScreen;
  MealItem(
      {this.heightOfCard,
      this.mealAffordability,
      this.index,
      this.mealComplexity,
      this.meals,
      this.getMealScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getMealScreen,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          elevation: 4,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      meals[index].imageUrl,
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
                        meals[index].title,
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
              //Expanded(
              //child:
              Container(
                height: 50,
                color: Color.fromRGBO(245, 250, 200, 0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.av_timer),
                        SizedBox(
                          width: 5,
                        ),
                        Text(meals[index].duration.toString()),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          mealAffordability(meals[index].affordability),
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
                          mealComplexity(meals[index].complexity),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
