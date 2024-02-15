import 'package:flutter/foundation.dart';
import 'package:flutterecommerceapp/models/Category.dart';

class Categories extends ChangeNotifier {
  CategoryItems findById(String id) {
    return _availableCategories.firstWhere((category) => category.id == id);
  }

  List<CategoryItems> get availableCategories => [..._availableCategories];
  final List<CategoryItems> _availableCategories = [
    CategoryItems(id: '1', title: 'Tops'),
    CategoryItems(id: '2', title: 'Flat'),
    CategoryItems(id: '3', title: 'Huge'),
    CategoryItems(id: '4', title: 'Sleek'),
    CategoryItems(id: '5', title: 'Comfy'),
  ];
}
