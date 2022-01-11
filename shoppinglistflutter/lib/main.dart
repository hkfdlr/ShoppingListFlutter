import 'package:flutter/material.dart';
import 'item.dart' as item;

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List App',
      home: ShoppingList(),
    );
  }
}

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  var groceries = <String>[];
  Icon searchBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('');

  item.ItemBuilder itemBuilder = item.ItemBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: _buildGrid(),
    );
  }

  Widget _buildGrid() {
    return GridView.count(
      crossAxisCount: 5,
      children: List.generate(groceries.length, (index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: itemBuilder.buildItem(groceries[index]),
        );
      }),
    );
  }
}