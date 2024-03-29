import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Padding.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/models/IconSelection.dart';

class SingleIconSection extends StatelessWidget {
  const SingleIconSection({
    super.key,
    required this.item,
    required this.index,
    required this.setCurrentIconSection,
    required this.currentIconSectionIndex,
  });

  final IconSection item;
  final int index;
  final Function setCurrentIconSection;
  final int currentIconSectionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 13,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setCurrentIconSection(index),
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: currentIconSectionIndex == index ? accentColor : boxBg,
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  color: currentIconSectionIndex == index
                      ? Colors.white
                      : iconColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            item.title,
            style: const TextStyle(color: greyFontColor),
          ),
        ],
      ),
    );
  }
}
