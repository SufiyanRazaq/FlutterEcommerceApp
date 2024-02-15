import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutterecommerceapp/Utils/Colors.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topStart(),
      badgeContent: const Text('9+'),
      showBadge: true,
      child: const Icon(
        Icons.comment_outlined,
        color: iconColor,
        size: 30,
      ),
    );
  }
}
