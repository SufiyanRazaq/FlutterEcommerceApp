import 'package:flutterecommerceapp/Views/entryScreen.dart';
import 'package:flutterecommerceapp/Widgets/mainScreen.dart';
import 'package:flutterecommerceapp/views/ProductDetails.dart';
import 'package:flutterecommerceapp/views/SplashScreen.dart';
import 'package:flutterecommerceapp/views/cart.dart';
import 'package:flutterecommerceapp/views/details.dart';
import 'package:flutterecommerceapp/views/orders.dart';
import 'package:flutterecommerceapp/views/payment.dart';

class RouteHelper {
  static const String splashScreen = "/splash";
  static const String entryScreen = "/entry_screen";
  static const String mainScreen = "/customer_home_screen";
  static const String productDetails = "/product_details_screen";
  static const String cartScreen = "/cart_screen";
  static const String storeScreen = "store_screen";
  static const String ordersScreen = '/order_screen';
  static const String paymentAcknowledgment = '/payment_acknowledgement';
}

final routes = {
  RouteHelper.splashScreen: (context) => const SplashScreen(),
  RouteHelper.entryScreen: (context) => const EntryScreen(),
  RouteHelper.mainScreen: (context) => const MainScreen(),
  RouteHelper.productDetails: (context) => const ProductDetails(),
  RouteHelper.cartScreen: (context) => const CartScreen(),
  RouteHelper.storeScreen: (context) => const StoreScreen(),
  RouteHelper.ordersScreen: (context) => const OrdersScreen(),
  RouteHelper.paymentAcknowledgment: (context) =>
      const PaymentAcknowledgmentScreen()
};
