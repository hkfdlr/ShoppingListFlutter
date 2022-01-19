import 'package:flutter/cupertino.dart';

class Grocery {
  String name;
  int? amount;

  Grocery({required this.name, this.amount});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Grocery &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      amount == other.amount;

  @override
  int get hashCode => name.hashCode ^ amount.hashCode;
}