import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/Widgets/SingleProduct.dart';
import 'package:flutterecommerceapp/models/Product.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';

import '../Provider/Cart.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    super.key,
    required this.products,
    required this.productsData,
    required this.categoriesData,
    required this.prodLocation,
    required this.cartData,
  });

  final List<Product> products;
  final Products productsData;
  final Categories categoriesData;
  final ProdLocation prodLocation;
  final Cart cartData;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        Product item = products[index];
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            RouteHelper.productDetails,
            arguments: {
              'product_id': item.id,
              'prodLocation': prodLocation,
            },
          ),
          child: SingleProductGrid(
            item: item,
            productData: productsData,
            categoryData: categoriesData,
            cartData: cartData,
            prodLocation: prodLocation,
          ),
        );
      },
    );
  }
}
