import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/Provider/store.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/models/Product.dart';
import 'package:readmore/readmore.dart';

import 'wrap.dart';

class AboutItemTab extends StatelessWidget {
  const AboutItemTab({
    super.key,
    required this.product,
    required this.categoryData,
    required this.storeData,
    required this.size,
    required this.products,
    required this.productData,
    required this.cartData,
    required this.navigateToStore,
  });
  final Product product;
  final Products productData;
  final Categories categoryData;
  final Stores storeData;
  final Size size;
  final List<Product> products;
  final Cart cartData;
  final Function navigateToStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  title: 'Brand',
                  data: product.brandName,
                ),
                KWrap(data: product.colorName, title: 'Color'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  data: categoryData.findById(product.catId).title,
                  title: 'Category',
                ),
                KWrap(
                  data: product.material,
                  title: 'Material',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  data: product.condition,
                  title: "Condition",
                ),
                KWrap(
                  data: product.heavy,
                  title: "Heavy",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: storeColor,
              thickness: 0.4,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Description:',
              style: getmediumStyle(
                color: accentColor,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                itemCount: product.descriptionList.length,
                itemBuilder: (context, index) {
                  var item = product.descriptionList[index];
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '+ $item',
                      style: getRegularStyle(
                        color: greyFontColor,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ReadMoreText(
              product.description,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more ',
              trimExpandedText: 'Show less ^',
              style: getRegularStyle(
                color: greyFontColor,
                fontSize: FontSize.s16,
              ),
              lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              moreStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: storeColor,
              thickness: 0.4,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Shipping Information',
              style: getmediumStyle(
                color: accentColor,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  data: product.shippingInformation.delivery,
                  title: 'Delivery',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  data: product.shippingInformation.shipping,
                  title: 'Shipping',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KWrap(
                  data: product.shippingInformation.arrival,
                  title: 'Arrivals',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Seller Information',
              style: getmediumStyle(
                color: accentColor,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: product.storeId,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      storeData.findById(product.storeId).imgUrl,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeData.findById(product.storeId).name,
                      style: getmediumStyle(
                        color: accentColor,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Acitve 5m ago | 94.3 Positive feedback',
                      style: getRegularStyle(
                        color: textBoxDark,
                        fontSize: FontSize.s10,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        side: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () => navigateToStore(),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.storefront,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Visit Store',
                            style: getRegularStyle(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
