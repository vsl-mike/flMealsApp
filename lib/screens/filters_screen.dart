import 'package:flutter/material.dart';
import '../widgets/meal_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtes';
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isLactose;
  bool _isGlutenFree;
  bool _isVegetarian;
  bool _isVegan;
  void getNewFilters() {
    Map<String, bool> currentFilters = {
      'isGlutenFree': _isGlutenFree,
      'isLactoseFree': _isLactose,
      'isVegetarian': _isVegetarian,
      'isVegan': _isVegan
    };
    widget.setFilters(currentFilters);
    Navigator.pushReplacementNamed(context,'/');
  }

  @override
  void initState() {
    _isLactose = widget.filters['isGlutenFree'];
    _isGlutenFree = widget.filters['isLactoseFree'];
    _isVegetarian = widget.filters['isVegetarian'];
    _isVegan = widget.filters['isVegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: getNewFilters,
          )
        ],
      ),
      drawer: MealDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Config your filters',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                SwitchListTile(
                  title: Text('Only no gluten meals'),
                  value: _isGlutenFree,
                  onChanged: (val) {
                    setState(
                      () {
                        _isGlutenFree = val;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text('Only no lactose meals'),
                  value: _isLactose,
                  onChanged: (val) {
                    setState(
                      () {
                        _isLactose = val;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text('Only vegetarian meals'),
                  value: _isVegetarian,
                  onChanged: (val) {
                    setState(
                      () {
                        _isVegetarian = val;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text('Only vegan meals'),
                  value: _isVegan,
                  onChanged: (val) {
                    setState(
                      () {
                        _isVegan = val;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
