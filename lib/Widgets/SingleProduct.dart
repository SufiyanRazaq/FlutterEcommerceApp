import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/models/Product.dart';

class SingleProductGrid extends StatelessWidget {
  const SingleProductGrid({
    super.key,
    required this.item,
    required this.productData,
    required this.categoryData,
    required this.cartData,
    required this.prodLocation,
  });

  final Product item;
  final Products productData;
  final Categories categoryData;
  final Cart cartData;
  final ProdLocation prodLocation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 105,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: imageBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Hero(
              tag: item.id,
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 5,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () =>
                      productData.toggleIsFavourite(item.id, prodLocation),
                  child: Icon(
                    item.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: item.isFavourite ? notiBg : iconColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () => cartData.addItemToCart(
                    item.id,
                    item.name,
                    item.price,
                    item.imageUrl,
                  ),
                  child: Icon(
                    cartData.isItemOnCart(item.id)
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                    color: cartData.isItemOnCart(item.id) ? notiBg : iconColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryData.findById(item.catId).title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                    color: greyFontColor,
                  ),
                ),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getmediumStyle(
                    color: Colors.black87,
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: starBg,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${item.rating} | ${item.soldNumber}',
                  style: getRegularStyle(
                    color: greyFontColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: Text(
              '\$${item.price}',
              style: getmediumStyle(
                color: primaryColor,
                fontSize: FontSize.s16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
