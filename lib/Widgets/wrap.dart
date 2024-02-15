import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';

class KWrap extends StatelessWidget {
  const KWrap({
    super.key,
    required this.data,
    required this.title,
  });

  final String data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '$title:',
          style: getRegularStyle(
            color: greyFontColor,
            fontSize: FontSize.s16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          data,
          style: getmediumStyle(
            color: accentColor,
            fontSize: FontSize.s12,
          ),
        ),
      ],
    );
  }
}
