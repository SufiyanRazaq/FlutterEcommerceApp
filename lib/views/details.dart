import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/Provider/store.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/models/Store.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = data['store_id'];
    var storeData = Provider.of<Stores>(context);
    var productData = Provider.of<Products>(context);
    Store store = storeData.findById(id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: boxBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: store.id,
                  child: Image.asset(
                    store.imgUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
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
                  store.name,
                  style: getRegularStyle(
                    color: storeColor,
                    fontSize: FontSize.s18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Products:',
              style: getmediumStyle(
                color: accentColor,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height / 3,
              child: ListView.builder(
                  itemCount: productData.storeProducts(store.id).length,
                  itemBuilder: (context, index) {
                    var item = productData.storeProducts(store.id)[index];
                    return productData.storeProducts(store.id).isNotEmpty
                        ? Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                  item.imageUrl,
                                ),
                              ),
                              title: Text(item.name),
                              subtitle: Text(
                                item.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                onPressed: () =>
                                    Navigator.of(context).pushNamed(
                                  RouteHelper.productDetails,
                                  arguments: {'product_id': item.id},
                                ),
                                icon: const Icon(
                                  Icons.chevron_right,
                                ),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'Store products are empty',
                            ),
                          );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
