import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'grocery.interface.dart';
import 'item.dart' as item;
import 'constants.dart' as specs;
import 'itemData.service.dart';

class AddItemPage extends StatefulWidget {
  item.ItemBuilder itemBuilder = item.ItemBuilder();
  specs.Constants constants = specs.Constants();
  final Function() notifyParent;
  List<String> suggestionList;

  AddItemPage(
      {Key? key, required this.notifyParent, required this.suggestionList})
      : super(key: key);

  @override
  AddItemPageState createState() => AddItemPageState();
}

class AddItemPageState extends State<AddItemPage> {

  final isMobile = specs.Constants.isMobile();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GridView.count(
      crossAxisCount: isMobile ? 3 : 5,
      padding: EdgeInsets.fromLTRB(isMobile ? 0 : screenWidth / 4, 0, isMobile ? 8 : screenWidth / 4, 0),
      children: List.generate(widget.suggestionList.length, (index) {
        return Container(
            padding: EdgeInsets.fromLTRB(isMobile ? 8 : 16, isMobile ? 8 : 16, 0, 0),
            child: _buildItem(Grocery(name: widget.suggestionList[index]), Colors.green));
      }),
    );
  }

  Widget _buildItem(Grocery grocery, Color color) {
    return ListTile(
      title: Text(
        grocery.name,
        style: TextStyle(fontSize: isMobile ? 16 : 18),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      enabled: true,
      onTap: () {
        ItemDataService.addItem(Grocery(name: grocery.name, amount: 1));

        widget.notifyParent();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: (ItemDataService.addedGroceries.firstWhereOrNull((element) => element.name == grocery.name)?.amount != null
                && (ItemDataService.addedGroceries.firstWhereOrNull((element) => element.name == grocery.name)?.amount)! > 1)
                ? Text('Added ${grocery.name} x${ItemDataService.addedGroceries.firstWhereOrNull((element) => element.name == grocery.name)?.amount}')
                : Text('Added ${grocery.name}'),
            duration: const Duration(milliseconds: 500),
          )
        );
      },
      tileColor: color,
      contentPadding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
    );
  }
}
