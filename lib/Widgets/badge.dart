import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CartIcon extends StatefulWidget {
  const CartIcon({super.key});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    var cartData = Provider.of<Cart>(context);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RouteHelper.cartScreen),
      child: badges.Badge(
        position: badges.BadgePosition.topStart(),
        badgeContent: Text(
          cartData.itemCount.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        showBadge: true,
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
