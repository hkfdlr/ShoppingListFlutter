import 'package:flutter/material.dart';

class ItemBuilder {
  buildItem(groceries) {
    return _buildItem(groceries);
  }

  Widget _buildItem(String groceries) {
    return ListTile(
      title: Text(
        groceries,
        style: const TextStyle(fontSize: 18.0),
      ),
      enabled: true,
      tileColor: Colors.red,
    );
  }
}