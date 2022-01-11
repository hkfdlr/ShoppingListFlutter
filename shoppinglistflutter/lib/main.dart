import 'package:flutter/material.dart';
import 'item.dart' as item;
import 'addItem.dart' as add_item;

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List App',
      home: ShoppingList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingList extends StatefulWidget {
  var groceries = <String>['Test1', 'Test2'];

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Icon searchBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('');

  item.ItemBuilder itemBuilder = item.ItemBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: onSearch()
                );
              },
              icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _buildGrid(),
    );
  }

  Widget _buildGrid() {
    return GridView.count(
      crossAxisCount: 5,
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      children: List.generate(widget.groceries.length, (index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: itemBuilder.buildItem(widget.groceries[index], Colors.red),
        );
      }),
    );
  }
}

class onSearch extends SearchDelegate {
  add_item.AddItem addItem = add_item.AddItem();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    debugPrint(context.toString());
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
      ? suggestionList = addItem.suggestedGroceries
      : suggestionList.addAll(addItem.suggestedGroceries.where(
            (element) => element.toLowerCase().contains(query.toLowerCase())
    ));
    return addItem.buildGrid(suggestionList);
  }

}