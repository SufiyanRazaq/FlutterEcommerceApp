import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/models/Product.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({
    super.key,
    required this.product,
    required this.cartData,
    required this.addToCart,
    required this.removeFromCart,
  });

  final Product product;
  final Cart cartData;
  final Function addToCart;
  final Function removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                  style: getRegularStyle(
                    color: greyFontColor,
                    fontSize: FontSize.s14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${product.price}',
                  style: getmediumStyle(
                    color: primaryColor,
                    fontSize: FontSize.s25,
                  ),
                ),
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          cartData.findItemQuantity(product.id).toString(),
                          style: getRegularStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => cartData.isItemOnCart(product.id)
                      ? removeFromCart()
                      : addToCart(),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        cartData.isItemOnCart(product.id)
                            ? 'Remove From Cart'
                            : 'Add To Cart',
                        style: getmediumStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
