import 'package:flutter/foundation.dart';
import 'package:flutterecommerceapp/models/CartItem.dart';

class Cart extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int findItemQuantity(String productId) {
    var quantity = 0;
    _items.forEach((key, value) {
      if (key == productId) {
        quantity = value.quantity;
      }
    });
    return quantity;
  }

  void toggleQuantity(String id, String operation) {
    switch (operation) {
      case 'Increment':
        if (_items.containsKey(id)) {
          _items.update(
            id,
            (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              imageUrl: existingCartItem.imageUrl,
            ),
          );
        }
        break;
      case 'decrement':
        if (_items.containsKey(id)) {
          _items.update(
              id,
              (existingCartItem) => CartItem(
                    productId: existingCartItem.productId,
                    id: existingCartItem.id,
                    name: existingCartItem.name,
                    price: existingCartItem.price,
                    quantity: existingCartItem.quantity - 1,
                    imageUrl: existingCartItem.imageUrl,
                  ));
        }
        break;
      default:
    }
    notifyListeners();
  }

  void removeFromCart(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void addItemToCart(
      String productID, String name, double price, String imageUrl) {
    if (_items.containsKey(productID)) {
      if (isItemOnCart(productID)) {
        _items.remove(productID);
      } else {
        _items.update(
            productID,
            (existingCartItem) => CartItem(
                  productId: existingCartItem.productId,
                  id: existingCartItem.id,
                  name: existingCartItem.name,
                  price: existingCartItem.price,
                  quantity: existingCartItem.quantity + 1,
                  imageUrl: existingCartItem.imageUrl,
                ));
      }
    } else {
      _items.putIfAbsent(
        productID,
        () => CartItem(
          productId: productID,
          id: DateTime.now().toString(),
          name: name,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  bool isItemOnCart(String productId) {
    return _items.containsKey(productId);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
