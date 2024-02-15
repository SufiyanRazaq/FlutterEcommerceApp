import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.searchText,
  });
  final TextEditingController searchText;

  void handleSearchText() {
    print(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchText,
      decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: GestureDetector(
            onTap: () => handleSearchText,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                AssetManager.search,
                color: greyFontColor,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: greyShade),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: greyShade,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: greyShade,
            ),
          )),
    );
  }
}
