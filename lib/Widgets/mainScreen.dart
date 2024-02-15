import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Widgets/homeScreen.dart';
import 'package:flutterecommerceapp/views/SettingScreen.dart';
import 'package:flutterecommerceapp/views/voucherScreen.dart';
import 'package:flutterecommerceapp/views/walletScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentPageIndex = 0;

  final List<Widget> _pages = const [
    CustomerHomeScreen(),
    VoucherScreen(),
    WalletScreen(),
    SettingScreen(),
  ];

  void setNewPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: setNewPage,
        currentIndex: _currentPageIndex,
        selectedIconTheme: const IconThemeData(
          color: primaryColor,
        ),
        unselectedIconTheme: IconThemeData(color: greyShade),
        showSelectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.confirmation_number_outlined,
            ),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _pages[_currentPageIndex],
    );
  }
}
