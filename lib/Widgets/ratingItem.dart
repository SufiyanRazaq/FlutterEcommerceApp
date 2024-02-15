import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    super.key,
    required this.index,
    required this.figure,
    required this.progessValue,
  });

  final String index;
  final String figure;
  final double progessValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            AssetManager.fullStar,
            width: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(index),
          const SizedBox(
            width: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    value: progessValue,
                    minHeight: 10,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                figure,
                style: getmediumStyle(
                  color: accentColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
