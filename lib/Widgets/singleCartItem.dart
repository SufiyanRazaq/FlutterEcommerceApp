import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Utils/YesNo.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/models/CartItem.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';

import 'text.dart';

class SingleCartItem extends StatelessWidget {
  const SingleCartItem({
    super.key,
    required this.item,
    required this.cartData,
  });

  final CartItem item;
  final Cart cartData;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          elevation: 3,
          title: Text(
            'Are you sure?',
            style: getmediumStyle(
              color: Colors.black,
              fontSize: FontSize.s18,
            ),
          ),
          content: Text(
            'Do you want to remove ${item.name} from cart?',
            style: getRegularStyle(
              color: Colors.black,
              fontSize: FontSize.s14,
            ),
          ),
          actions: [
            textAction('Yes', YesNo.yes, context),
            textAction('No', YesNo.no, context),
          ],
        ),
      ),
      onDismissed: (direction) => cartData.removeFromCart(item.productId),
      direction: DismissDirection.endToStart,
      background: Container(
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(RouteHelper.productDetails, arguments: {
          'product_id': item.productId,
          'prodLocation': ProdLocation.availableProducts,
        }),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  item.imageUrl,
                ),
              ),
              title: Text(item.name),
              subtitle: Row(
                children: [
                  Text(
                    '\$${item.price}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getmediumStyle(color: accentColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Quantity: ${item.quantity}'),
                ],
              ),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (item.quantity > 1) {
                        cartData.toggleQuantity(
                          item.productId,
                          'decrement',
                        );
                      }
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: item.quantity == 1 ? Colors.grey : primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartData.toggleQuantity(
                        item.productId,
                        'Increment',
                      );
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
