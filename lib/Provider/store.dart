import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/models/Store.dart';

class Stores extends ChangeNotifier {
  Store findById(String id) {
    return _availableStores.firstWhere(
      (store) => store.id == id,
      orElse: () => Store(id: '1', name: 'Store', imgUrl: AssetManager.store3),
    );
  }

  List<Store> get availableStores => [..._availableStores];

  final List<Store> _availableStores = [
    Store(
      id: '1',
      name: 'Super Store',
      imgUrl: AssetManager.store1,
    ),
    Store(
      id: '2',
      name: 'Online Store',
      imgUrl: AssetManager.store2,
    ),
    Store(
      id: '3',
      name: 'Better Store',
      imgUrl: AssetManager.store3,
    ),
  ];
}
