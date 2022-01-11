import 'package:flutter/material.dart';
import 'constants.dart' as specs;
import 'itemData.service.dart' as item_data_service;

class ItemBuilder {
  specs.Constants constants = specs.Constants();


  buildItem(String groceries, Color color) {
    return _buildItem(groceries, color);
  }

  Widget _buildItem(String groceries, Color color) {
    return ListTile(
      title: Text(
          groceries,
          style: TextStyle(fontSize: specs.Constants.isMobile() ? 16 : 18),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      enabled: true,
      onTap: () {
        if (item_data_service.ItemDataService.addedGroceries.contains(groceries)) {
          item_data_service.ItemDataService.removeItem(groceries);

        } else {
          item_data_service.ItemDataService.addItem(groceries);
        }
      },
      tileColor: color,
      contentPadding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
    );
  }
}