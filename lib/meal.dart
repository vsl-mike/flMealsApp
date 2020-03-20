enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

enum Complexity{
  Simple,
  Challenging,
  Hard
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  const Meal({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.duration,
    this.imageUrl,
    this.ingredients,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
    this.steps,
  });
}
