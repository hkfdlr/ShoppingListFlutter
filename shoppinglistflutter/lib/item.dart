import 'package:flutter/material.dart';
import 'package:shoppinglistflutter/grocery.interface.dart';
import 'constants.dart' as specs;
import 'itemData.service.dart';

class ItemBuilder {
  specs.Constants constants = specs.Constants();

  ItemDataService itemDataService = ItemDataService();

  buildItem(String groceries, Color color) {
    return _buildItem(groceries, color);
  }

  Widget _buildItem(String grocery, Color color) {
    return ListTile(
      title: Text(
          grocery,
          style: TextStyle(fontSize: specs.Constants.isMobile() ? 16 : 18),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      enabled: true,
      onTap: () {
        itemDataService.addItem(Grocery(name: grocery));
      },
      tileColor: color,
      contentPadding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
    );
  }
}