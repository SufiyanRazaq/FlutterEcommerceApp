import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';

class PaymentAcknowledgmentScreen extends StatefulWidget {
  const PaymentAcknowledgmentScreen({super.key});

  @override
  State<PaymentAcknowledgmentScreen> createState() =>
      _PaymentAcknowledgmentScreenState();
}

class _PaymentAcknowledgmentScreenState
    extends State<PaymentAcknowledgmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                RouteHelper.mainScreen,
              ),
              child: const Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            );
          },
        ),
        actions: const [
          Icon(
            Icons.print,
            color: iconColor,
            size: 30,
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                AssetManager.success,
              ),
              const Text(
                'You have successfully completed this :)',
                style: TextStyle(
                  fontSize: 15,
                  color: greyFontColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
