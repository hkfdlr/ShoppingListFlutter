import 'package:flutter_test/flutter_test.dart';
import 'package:shoppinglistflutter/grocery.interface.dart';
import 'package:shoppinglistflutter/itemData.service.dart';

void main() {
  group ('service tests', ()
  {
    final service = ItemDataService();
    final initialAdded = service.getAddedItems().toList();

    test('service should return suggestions', () {
      final results = service.getSuggestions();
      expect(results, ItemDataService.suggestedGroceries);
    });

    test('service should return added Groceries', () {
      final results = service.getAddedItems();
      expect(results, initialAdded);
    });

    test('service should add item', () {
      List<Grocery> before = List.from(service.getAddedItems());
      Grocery newItem = Grocery(name: 'UnitTest1', amount: 1);
      service.addItem(newItem);
      List<Grocery> after = List.from(service.getAddedItems());

      expect(after, [...before, Grocery(name: newItem.name, amount: 1)]);
    });
    
    test('service should remove item', () {
      List<Grocery> before = List.from(service.getAddedItems());
      Grocery itemToRemove = before[0];
      service.removeItem(itemToRemove);
      List<Grocery> after = List.from(service.getAddedItems());
      List<Grocery> beforeAndFirstRemoved = [];
      
      before.asMap().forEach((index, element) => {
        if (index > 0) {
          beforeAndFirstRemoved.add(element)
        }
      });

      expect(after, beforeAndFirstRemoved);
    });
  });
}