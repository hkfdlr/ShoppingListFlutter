import 'package:flutter/widgets.dart';
import 'package:shoppinglistflutter/grocery.interface.dart';
import 'package:collection/collection.dart';

class ItemDataService {
  static var addedGroceries = [Grocery(name: 'Test1', amount: 1), Grocery(name: 'Test2', amount: 2)];

  static var suggestedGroceries = [
    'Apple','Banana','Strawberry', 'Avocado', 'Bell Pepper', 'Carrot', 'Garlic', 'Lemon',
    'Onion', 'Parsley', 'Cilantro', 'Basil', 'Potato', 'Spinach', 'Tomato', 'Bread', 'Pasta',
    'Quinoa', 'Rice', 'Tortilla', 'Chicken', 'Eggs', 'Ground Beef', 'Turkey', 'Butter',
    'Sliced Cheese', 'Shredded Cheese', 'Milk', 'Sour Cream', 'Greek Yogurt', 'Yoghurt',
    'Baking powder', 'Baking Soda', 'Sugar', 'Brown Sugar', 'Flour', 'Honey', 'Vanilla',
    'Dry Yeast', 'Chocolate Chips', 'Cocoa Powder', 'Powdered Sugar', 'Corn', 'Broccoli',
    'Pizza', 'Stock', 'Broth', 'Salsa', 'Jam', 'Jelly', 'Peanut Butter', 'Pasta Sauce',
    'Black Beans', 'Soups', 'Tuna', 'Chili'
  ];

  static addItem(Grocery grocery) {
    var groceryToCheck = addedGroceries.firstWhereOrNull((element) => element.name == grocery.name);
    var index = -1;
    if (groceryToCheck != null) {
      index = addedGroceries.indexOf(groceryToCheck);
    }
    if (index > -1) {
      addedGroceries[index].amount = addedGroceries[index].amount! + 1;
    } else {
      addedGroceries.add(Grocery(name: grocery.name, amount: grocery.amount));
    }
    addedGroceries.sort((a,b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  static removeItem(String grocery) {
    var groceryToRemove = addedGroceries.firstWhere((element) => element.name == grocery);
    var index = addedGroceries.indexOf(groceryToRemove);
    addedGroceries.removeAt(index);
  }
}