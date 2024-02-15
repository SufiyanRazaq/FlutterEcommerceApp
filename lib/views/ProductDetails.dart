import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/Provider/reviews.dart';
import 'package:flutterecommerceapp/Provider/store.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/Widgets/badge.dart';
import 'package:flutterecommerceapp/Widgets/productDetailImage.dart';
import 'package:flutterecommerceapp/models/Product.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';
import 'package:provider/provider.dart';

import '../Widgets/itemProduct.dart';
import '../Widgets/productdetailsheet.dart';
import '../Widgets/reviewItemProduct.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  var currentImageIndex = 0;
  List<String> reviewTags = ['Popular', 'Trending', 'Latest', 'Yesterday'];

  var currentReviewTag = 'Popular';
  late AnimationController _controller;
  late Animation<double> _animation;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 500 milliseconds
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

// Initialize the animation to fade from 0 to 1 while sliding up from 50 pixels below the view
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

// start the animation
    _controller.forward();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //change review tag
  void changeReviewTag(String value) {
    setState(() {
      currentReviewTag = value;
    });
  }

// set image index
  void setImageIndex(int index) {
    setState(() {
      currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String id = data['product_id'];
    ProdLocation? prodLocation = data['prodLocation'] as ProdLocation?;

    var productData = Provider.of<Products>(context);
    var storeData = Provider.of<Stores>(context);
    var cartData = Provider.of<Cart>(context);
    var categoryData = Provider.of<Categories>(context);
    var reviewData = Provider.of<Reviews>(context);

    Product product = productData.findById(id);
    List<Product> products =
        Provider.of<Products>(context, listen: false).recommendedProducts;

    // add to Cart
    void addToCart() {
      cartData.addItemToCart(
        product.id,
        product.name,
        product.price,
        product.imageUrl,
      );
    }

    // remove from cart
    void removeFromCart() {
      cartData.removeFromCart(product.id);
    }

    void navigateToStore() {
      Navigator.of(context).pushNamed(
        RouteHelper.storeScreen,
        arguments: {'store_id': product.id},
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: iconColor,
            ),
          );
        }),
        actions: [
          GestureDetector(
            onTap: () =>
                productData.toggleIsFavourite(product.id, prodLocation!),
// toggling isFavorite from product provider
            child: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: product.isFavourite ? notiBg : iconColor,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.share_outlined,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          const CartIcon(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
            ),
          ),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productDetailsImageSection(
                  size,
                  product,
                  currentImageIndex,
                  setImageIndex,
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      Icons.storefront,
                      color: storeColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      storeData.findById(product.storeId).name,
                      style: getRegularStyle(color: storeColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.name,
                  style: getmediumStyle(
                    color: accentColor,
                    fontSize: FontSize.s20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: starBg,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${product.rating} Ratings',
                          style: getRegularStyle(
                            color: greyFontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: FontSize.s13,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '+',
                      style: getRegularStyle(
                        color: greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.s13,
                      ),
                    ),
                    Text(
                      '${product.reviews.length}K Reviews',
                      style: getRegularStyle(
                        color: greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.s13,
                      ),
                    ),
                    Text(
                      '+',
                      style: getRegularStyle(
                        color: greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.s13,
                      ),
                    ),
                    Text(
                      '${product.soldNumber}K Sold',
                      style: getRegularStyle(
                        color: greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'About Item',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                  ],
                  unselectedLabelColor: greyFontColor,
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: size.height * 1.6,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
// About Product TAB
                      AboutItemTab(
                        product: product,
                        categoryData: categoryData,
                        storeData: storeData,
                        size: size,
                        products: products,
                        productData: productData,
                        cartData: cartData,
                        navigateToStore: navigateToStore,
                      ),
                      reviewTab(
                          product: product,
                          size: size,
                          reviewData: reviewData,
                          currentReviewTag: currentReviewTag,
                          reviewsTag: reviewTags,
                          changeReviewTag: changeReviewTag),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ProductDetailsBottomSheet(
        product: product,
        cartData: cartData,
        addToCart: addToCart,
        removeFromCart: removeFromCart,
      ),
    );
  }
}
