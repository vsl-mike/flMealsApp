import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../screens/meal_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  void _getMealScreen(BuildContext context, Meal meal) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: meal);
  }
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
    
  @override
  Widget build(BuildContext context) {
    double _heightOfCard = MediaQuery.of(context).size.height * 0.45;
    return Center(
      child: favoriteMeals.isEmpty ? Text('Favorites is empty'):
      ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, _index) {
          return MealItem(
            meal: favoriteMeals[_index],
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
