import 'package:flutter/material.dart';
import 'item.dart' as item;

class AddItem {
  item.ItemBuilder itemBuilder = item.ItemBuilder();

  buildGrid(List<String> suggestionList) {
    return build(suggestionList);
  }

  Widget build(List<String> suggestionList) {
    return GridView.count(
      crossAxisCount: 5,
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      children: List.generate(suggestionList.length, (index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: itemBuilder.buildItem(suggestionList[index], Colors.green)
        );
      }),
    );
  }

  var suggestedGroceries = [
    'Apple',
    'Banana',
    'Strawberry',
    'Avocado',
    'Bell Pepper',
    'Carrot',
    'Garlic',
    'Lemon',
    'Onion',
    'Parsley',
    'Cilantro',
    'Basil',
    'Potato',
    'Spinach',
    'Tomato',
    'Bread',
    'Pasta',
    'Quinoa',
    'Rice',
    'Tortilla',
    'Chicken',
    'Eggs',
    'Ground Beef',
    'Turkey',
    'Butter',
    'Sliced Cheese',
    'Shredded Cheese',
    'Milk',
    'Sour Cream',
    'Greek Yogurt',
    'Yoghurt',
    'Baking powder',
    'Baking Soda',
    'Sugar',
    'Brown Sugar',
    'Flour',
    'Honey',
    'Vanilla',
    'Dry Yeast',
    'Chocolate Chips',
    'Cocoa Powder',
    'Powdered Sugar',
    'Corn',
    'Broccoli',
    'Pizza',
    'Stock',
    'Broth',
    'Salsa',
    'Jam',
    'Jelly',
    'Peanut Butter',
    'Pasta Sauce',
    'Black Beans',
    'Soups',
    'Tuna',
    'Chili'
  ];
}