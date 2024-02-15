import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';

class KDotsIndicator extends StatelessWidget {
  const KDotsIndicator({
    super.key,
    required this.dotscount,
    required this.position,
  });

  final int dotscount;
  final int position;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotscount,
      position: position,
      decorator: DotsDecorator(
        color: Colors.grey,
        size: const Size.square(4.0),
        activeSize: const Size(18.0, 5.0),
        activeColor: accentColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        spacing: const EdgeInsets.only(right: 4),
      ),
    );
  }
}
