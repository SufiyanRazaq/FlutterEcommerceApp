import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Order.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/Provider/reviews.dart';
import 'package:flutterecommerceapp/ResourcesItems/Theme.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Views/entryScreen.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';

import 'Provider/store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: accentColor,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Reviews(),
        ),
        ChangeNotifierProvider(
          create: (context) => Stores(),
        ),
        ChangeNotifierProvider(
          create: (context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const EntryScreen(),
        title: 'Shoe\'s Store',
        theme: getLightTheme(),
        routes: routes,
      ),
    );
  }
}
