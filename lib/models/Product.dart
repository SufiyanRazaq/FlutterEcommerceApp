import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/models/ShippingInformation.dart';

class Product with ChangeNotifier {
  final String id;
  final String storeId;
  final String name;
  final String brandName;
  final String colorName;
  final String catId;
  final String imageUrl;
  final String material;
  final String condition;
  final String heavy;
  final List<String> otherImgs;
  final String description;
  final List<String> descriptionList;
  final double price;
  final double rating;
  final List<String> reviews;
  final double soldNumber;
  final ShippingInformation shippingInformation;
  bool isFavourite;

  Product({
    required this.id,
    required this.storeId,
    required this.name,
    required this.brandName,
    required this.catId,
    required this.material,
    required this.condition,
    required this.heavy,
    required this.imageUrl,
    required this.otherImgs,
    required this.description,
    required this.descriptionList,
    required this.reviews,
    required this.soldNumber,
    required this.shippingInformation,
    required this.colorName,
    required this.price,
    required this.rating,
    this.isFavourite = false,
  });

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }
}
