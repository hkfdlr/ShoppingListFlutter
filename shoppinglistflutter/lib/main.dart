import 'package:flutter/material.dart';
import 'addItem.dart';
import 'grocery.interface.dart';
import 'item.dart' as item;
import 'constants.dart' as specs;
import 'itemData.service.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shopping List App',
      home: ShoppingList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  var isMobile = specs.Constants.isMobile();

  Icon searchBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('');
  ItemDataService itemDataService = ItemDataService();

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
              showSearch(context: context, delegate: onSearch(refresh, itemDataService));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _buildGrid(),
    );
  }

  Widget _buildGrid() {
    double screenWidth = MediaQuery.of(context).size.width;

    return GridView.count(
      crossAxisCount: isMobile ? 3 : 5,
      padding: EdgeInsets.fromLTRB(isMobile ? 0 : screenWidth / 4, 0, isMobile ? 8 : screenWidth / 4, 0),
      children: List.generate(itemDataService.getAddedItems().length, (index) {
        return Container(
          padding: EdgeInsets.fromLTRB(isMobile ? 8 : 16, isMobile ? 8 : 16, 0, 0),
          child: _buildItem(itemDataService.getAddedItems()[index]),
        );
      }),
    );
  }

  Widget _buildItem(Grocery grocery) {
    return ListTile(
      title: Text(
        grocery.name,
        style: TextStyle(fontSize: isMobile ? 16 : 18),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: grocery.amount! > 1
          ? Text(
            'Amount: ${grocery.amount.toString()}',
            style: TextStyle(fontSize: isMobile ? 16 : 18),
            textAlign: TextAlign.center,
          )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      enabled: true,
      onTap: () {
        setState(() {
          itemDataService.removeItem(grocery);
        });
      },
      tileColor: Colors.red,
      contentPadding: const EdgeInsets.all(4),
    );
  }

  refresh() {
    setState(() {});
  }
}

class onSearch extends SearchDelegate {
  item.ItemBuilder itemBuilder = item.ItemBuilder();
  late Function() refresh;
  late ItemDataService itemDataService;
  onSearch(this.refresh, this.itemDataService);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = itemDataService.getSuggestions()
        : suggestionList.addAll(itemDataService.getSuggestions().where(
            (element) => element.toLowerCase().contains(query.toLowerCase())));

    return AddItemPage(notifyParent: refresh, suggestionList: suggestionList);
  }
}
