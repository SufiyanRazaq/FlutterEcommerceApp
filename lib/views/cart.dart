import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Order.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Utils/status.dart';
import 'package:flutterecommerceapp/Widgets/badge.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';

import '../ResourcesItems/Fonts.dart';
import '../Widgets/singleCartItem.dart';
import '../Widgets/snackMessage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartData = Provider.of<Cart>(context);

    void orderNow() {
      if (cartData.totalAmount > 0) {
        Provider.of<Orders>(context, listen: false)
            .addOrder(cartData.totalAmount, cartData.items.values.toList());
        Provider.of<Cart>(context, listen: false).clearCart();
        Navigator.of(context).pushNamed(RouteHelper.ordersScreen);
      } else {
        displaySnackBar(
          status: Status.error,
          message: 'Cart is empty!',
          context: context,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            );
          },
        ),
        title: const Text('Cart'),
        actions: [
          CartIcon(),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              RouteHelper.ordersScreen,
            ),
            child: const Icon(
              Icons.shopping_cart_checkout,
              color: iconColor,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: cartData.items.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Image.asset(
                      AssetManager.empty,
                    ),
                    const Text(
                      'opps! Your cart list is empty',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: cartData.items.length,
                itemBuilder: (context, index) {
                  var item = cartData.items.values.toList()[index];
                  return SingleCartItem(
                    item: item,
                    cartData: cartData,
                  );
                },
              ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: getRegularStyle(
                      color: greyFontColor,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${cartData.totalAmount.toStringAsFixed(2)}',
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
                    width: 60,
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
                            cartData.itemCount.toString(),
                            style: getRegularStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => orderNow(),
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )),
                      child: Center(
                        child: Text(
                          'Order Now',
                          style: getmediumStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
