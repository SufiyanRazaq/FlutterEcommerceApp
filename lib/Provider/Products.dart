import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/models/Product.dart';
import 'package:flutterecommerceapp/models/ShippingInformation.dart';

class Products with ChangeNotifier {
  void toggleIsFavourite(String id, ProdLocation prodLocation) async {
    Product product;
    if (prodLocation == ProdLocation.availableProducts) {
      product = _availableProducts.firstWhere((product) => product.id == id);
    } else {
      product = _recommendedProducts.firstWhere((product) => product.id == id);
    }
    product.toggleFavourite();
    notifyListeners();
  }

  bool isItemOnFavourite(Product product) {
    return _availableProducts.any((product) => product.isFavourite == true);
  }

  List<Product> get availableProducts {
    return [..._availableProducts];
  }

  Product findById(String id) {
    return availableProducts.firstWhere((product) => product.id == id);
  }

  List<Product> get favItems {
    return _availableProducts.where((product) => product.isFavourite).toList();
  }

  List<Product> get recommendedProducts => [..._recommendedProducts];

  final List<Product> _recommendedProducts = [
    Product(
      id: 'p9',
      storeId: '2',
      name: 'Ultra Nike',
      brandName: 'Smart Nike',
      catId: '4',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/12_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/12_1.png',
        'assets/images/shoe_imgs/12_2.png',
        'assets/images/shoe_imgs/12_3.png',
        'assets/images/shoe_imgs/12_5.png',
        'assets/images/shoe_imgs/12_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Blue shade',
      price: 50.90,
      rating: 2.3,
    ),
    Product(
      id: 'p10',
      storeId: '3',
      name: 'Nike Sleeve',
      brandName: 'Grey Nike',
      catId: '3',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/13_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/13_1.png',
        'assets/images/shoe_imgs/13_2.png',
        'assets/images/shoe_imgs/13_3.png',
        'assets/images/shoe_imgs/13_4.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Black',
      price: 70.90,
      rating: 4.0,
    ),
  ];
  List<Product> storeProducts(String storeId) {
    return availableProducts
        .where((product) => product.storeId == storeId)
        .toList();
  }

  final List<Product> _availableProducts = [
    Product(
      id: 'p1',
      storeId: '1',
      name: 'Nike Ups',
      brandName: 'Grey Nike',
      catId: '1',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/1_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/1_1.png',
        'assets/images/shoe_imgs/1_2.png',
        'assets/images/shoe_imgs/1_3.png',
        'assets/images/shoe_imgs/1_4.png',
        'assets/images/shoe_imgs/1_5.png',
        'assets/images/shoe_imgs/1_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 20,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Green',
      price: 30.90,
      rating: 4.3,
    ),
    Product(
      id: 'p2',
      storeId: '2',
      name: 'Nike Top',
      brandName: 'Grey Nike',
      catId: '3',
      material: 'Fiber',
      condition: 'New',
      heavy: '300g',
      imageUrl: 'assets/images/shoe_imgs/2_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/2_1.png',
        'assets/images/shoe_imgs/2_2.png',
        'assets/images/shoe_imgs/2_3.png',
        'assets/images/shoe_imgs/2_4.png',
        'assets/images/shoe_imgs/2_5.png',
        'assets/images/shoe_imgs/2_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Red',
      price: 20.90,
      rating: 4.0,
      isFavourite: true,
    ),
    Product(
      id: 'p3',
      storeId: '3',
      name: ' Sleek Nike',
      brandName: 'Grey Nike',
      catId: '3',
      material: 'Leather',
      condition: 'New',
      heavy: '200g',
      imageUrl: 'assets/images/shoe_imgs/3_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/3_1.png',
        'assets/images/shoe_imgs/3_2.png',
        'assets/images/shoe_imgs/3_3.png',
        'assets/images/shoe_imgs/3_4.png',
        'assets/images/shoe_imgs/3_5.png',
        'assets/images/shoe_imgs/3_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'White',
      price: 60.90,
      rating: 4.0,
    ),
    Product(
      id: 'p4',
      storeId: '1',
      name: 'Nike BlackPack',
      brandName: 'Grey Nike',
      catId: '3',
      material: 'Silk',
      condition: 'New',
      heavy: '100g',
      imageUrl: 'assets/images/shoe_imgs/4_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/4_1.png',
        'assets/images/shoe_imgs/4_2.png',
        'assets/images/shoe_imgs/4_3.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Blue',
      price: 90.90,
      rating: 3.3,
    ),
    Product(
      id: 'p5',
      storeId: '2',
      name: 'Smooth Nike',
      brandName: 'Smart Nike',
      catId: '4',
      material: 'Leather',
      condition: 'New',
      heavy: '120g',
      imageUrl: 'assets/images/shoe_imgs/5_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/5_1.png',
        'assets/images/shoe_imgs/5_2.png',
        'assets/images/shoe_imgs/5_3.png',
        'assets/images/shoe_imgs/5_4.png',
        'assets/images/shoe_imgs/5_5.png',
        'assets/images/shoe_imgs/5_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'White',
      price: 50.90,
      rating: 1.3,
    ),
    Product(
      id: 'p6',
      storeId: '2',
      name: 'Nike Slider',
      brandName: 'Leo Nike',
      catId: '1',
      material: 'Leather',
      condition: 'New',
      heavy: '300g',
      imageUrl: 'assets/images/shoe_imgs/6_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/6_1.png',
        'assets/images/shoe_imgs/6_2.png',
        'assets/images/shoe_imgs/6_3.png',
        'assets/images/shoe_imgs/6_4.png',
        'assets/images/shoe_imgs/6_5.png',
        'assets/images/shoe_imgs/6_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 10,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Green',
      price: 70.90,
      rating: 1.0,
    ),
    Product(
      id: 'p7',
      storeId: '3',
      name: 'Neo Nike',
      brandName: 'Leo Nike',
      catId: '3',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/7_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/7_1.png',
        'assets/images/shoe_imgs/8_3.png',
        'assets/images/shoe_imgs/7_3.png',
        'assets/images/shoe_imgs/7_4.png',
        'assets/images/shoe_imgs/8_1.png',
        'assets/images/shoe_imgs/8_8.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'White',
      price: 20.90,
      rating: 3.0,
    ),
    Product(
      id: 'p8',
      storeId: '2',
      name: 'Leather BackPack',
      brandName: 'Leo Nike',
      catId: '4',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/11_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/11_1.png',
        'assets/images/shoe_imgs/11_2.png',
        'assets/images/shoe_imgs/11_3.png',
        'assets/images/shoe_imgs/11_8.png',
        'assets/images/shoe_imgs/11_5.png',
        'assets/images/shoe_imgs/11_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Black',
      price: 40.90,
      rating: 3.3,
    ),
    Product(
      id: 'p9',
      storeId: '2',
      name: 'Ultra Nike',
      brandName: 'Smart Nike',
      catId: '4',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/12_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/12_1.png',
        'assets/images/shoe_imgs/12_2.png',
        'assets/images/shoe_imgs/12_3.png',
        'assets/images/shoe_imgs/12_5.png',
        'assets/images/shoe_imgs/12_6.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Blue Shade',
      price: 50.90,
      rating: 2.0,
    ),
    Product(
      id: 'p10',
      storeId: '3',
      name: 'Nike Sleeve',
      brandName: 'Leo Nike',
      catId: '3',
      material: 'Leather',
      condition: 'New',
      heavy: '400g',
      imageUrl: 'assets/images/shoe_imgs/13_1.png',
      otherImgs: [
        'assets/images/shoe_imgs/13_1.png',
        'assets/images/shoe_imgs/13_2.png',
        'assets/images/shoe_imgs/13_3.png',
        'assets/images/shoe_imgs/13_4.png',
      ],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis egestas leo, vel vestibulum risus. Fusce porta dui a risus sagittis.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit. Proin quis egestas leo',
        'Integer id tincidunt sapien, nec suscipit est',
        'Suspendisse potenti. Maecenas congue',
        'Nulla vitae dui a nunc tristique placerat.',
      ],
      reviews: ['1', '2', '3'],
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'Free international Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      colorName: 'Black',
      price: 70.90,
      rating: 4.0,
    ),
  ];
}
