import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Order.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';

import '../Utils/Colors.dart';
import '../Widgets/orderDown.dart';
import '../Widgets/singleOrderItem.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context, listen: false);

    void orderNow() {
      orderData.clearOrder();
      Navigator.of(context).pushNamed(RouteHelper.paymentAcknowledgment);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Orders',
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
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
      ),
      body: orderData.orders.isEmpty
          ? const Center(
              child: Text(
                'Opps! Your order list is empty',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          : Consumer<Orders>(
              builder: (_, orders, o) => Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: orders.orders.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: SingleOrderItem(
                          id: orders.orders[index].id,
                          totalAmount: orders.orders[index].totalAmount,
                          date: orders.orders[index].orderDate,
                          orders: orders.orders[index],
                        ),
                      ),
                    ),
                  ),
                  OrderDownSummary(
                    totalAmount: orders.getTotal,
                    cartItem: orders.orders,
                    orderNow: orderNow,
                  )
                ],
              ),
            ),
    );
  }
}
