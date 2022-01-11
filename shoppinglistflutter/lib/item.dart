import 'package:flutter/material.dart';

class ItemBuilder {
  buildItem(String groceries, Color color) {
    return _buildItem(groceries, color);
  }

  Widget _buildItem(String groceries, Color color) {
    return ListTile(
      title: Text(
        groceries,
        style: const TextStyle(fontSize: 18.0),
      ),
      enabled: true,
      tileColor: color,
    );
  }
}