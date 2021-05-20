import 'package:flutter/material.dart';
import 'package:foodyz/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function filters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isvegeterian = false;
  bool _glutenfree = false;
  bool _vegan = false;
  bool _lactosefree = false;
  @override
  initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _isvegeterian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildSwitchListStyle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      value: currentValue,
      subtitle: Text(
        description,
        style: TextStyle(color: Colors.grey),
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenfree,
                'lactose': _lactosefree,
                'vegeterian': _isvegeterian,
                'vegan': _vegan,
              };
              widget.filters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListStyle(
                  'gluten_free',
                  'only includes gluten-free meals',
                  _glutenfree,
                  (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  },
                ),
                _buildSwitchListStyle(
                  'Lactose_free',
                  'only includes Lactose-free meals',
                  _lactosefree,
                  (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
                _buildSwitchListStyle(
                  'Vegeterian ',
                  'only includes vegeterian meals',
                  _isvegeterian,
                  (newValue) {
                    setState(() {
                      _isvegeterian = newValue;
                    });
                  },
                ),
                _buildSwitchListStyle(
                  'Vegan ',
                  'only includes vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
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
