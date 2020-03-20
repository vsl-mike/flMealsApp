import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = '/categories_item';
  void _getMealScreen() {}
  String get mealAffordability {
    return ' ';
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final List<Meal> _meals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(arguments['id']);
      },
    ).toList();

    String _mealAffordability(Affordability aff) {
      switch (aff) {
        case Affordability.Affordable:
          return 'Cheep';
          break;
        case Affordability.Pricey:
          return 'Pricey';
          break;
        case Affordability.Luxurious:
          return 'Luxury';
          break;
        default:
          return 'Unknown';
      }
    }

    String _mealComplexity(Complexity compl) {
      switch (compl) {
        case Complexity.Simple:
          return 'Simple';
          break;
        case Complexity.Challenging:
          return 'Challenging';
          break;
        case Complexity.Hard:
          return 'Hard';
          break;
        default:
          return 'Unknown';
      }
    }

    double _heightOfCard = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (ctx, _index) {
          return MealItem(
            meals: _meals,
            index: _index,
            mealComplexity: _mealComplexity,
            mealAffordability: _mealAffordability,
            getMealScreen: _getMealScreen,
            heightOfCard: _heightOfCard,
          );
        },
      ),
    );
  }
}
