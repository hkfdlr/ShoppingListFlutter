class ItemDataService {
  static var addedGroceries = <String>['Test1', 'Test2'];

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

  static addItem(groceries) {
    addedGroceries.add(groceries);
    addedGroceries.sort((a,b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
  }

  static removeItem(groceries) {
    addedGroceries.remove(groceries);
  }
}