import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Provider/Cart.dart';
import 'package:flutterecommerceapp/Provider/Category.dart';
import 'package:flutterecommerceapp/Provider/Products.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/Padding.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Utils/productLocation.dart';
import 'package:flutterecommerceapp/Widgets/SingleIcon.dart';
import 'package:flutterecommerceapp/Widgets/badge.dart';
import 'package:flutterecommerceapp/Widgets/carouselSingleSlider.dart';
import 'package:flutterecommerceapp/Widgets/dotIndicator.dart';
import 'package:flutterecommerceapp/Widgets/messageIcon.dart';
import 'package:flutterecommerceapp/Widgets/productGridBuilder.dart';
import 'package:flutterecommerceapp/Widgets/searchBox.dart';
import 'package:flutterecommerceapp/models/CarouselItem.dart';
import 'package:flutterecommerceapp/models/IconSelection.dart';
import 'package:flutterecommerceapp/models/Product.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final TextEditingController searchText = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    setState(() {
      _scrollController.addListener(() {
        setState(() {
          _isScrolled = _scrollController.offset > 0;
        });
      });
    });
    super.initState();
  }

  var currentCarouselIndex = 0;
  var currentIconSelectionIndex = 0;

  final List<IconSection> iconSections = [
    IconSection(icon: Icons.grid_view, title: 'Category'),
    IconSection(icon: Icons.flight, title: 'Flight'),
    IconSection(icon: Icons.receipt, title: 'Bill'),
    IconSection(icon: Icons.language, title: 'Date plan'),
    IconSection(icon: Icons.monetization_on, title: 'Top Up'),
  ];

  final List<CarouselItem> carouselItem = [
    CarouselItem(
      hashTag: '#FASHION DAY',
      title: '80% OFF',
      desc: 'Discover fashion that suits to \n your style',
      imgSrc: AssetManager.slider1,
    ),
    CarouselItem(
      hashTag: '#NEW COLLECTION',
      title: '75% OFF',
      desc: 'Select designs that suits to \n your style',
      imgSrc: AssetManager.slider2,
    ),
    CarouselItem(
      hashTag: '#FASHION WEEK',
      title: '50% OFF',
      desc: 'Choose the shoes that suits to \n your style',
      imgSrc: AssetManager.slider3,
    ),
  ];

  void checkItOut() {}

  void setCurrentIconSection(int index) {
    setState(() {
      currentIconSelectionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Product> products =
        Provider.of<Products>(context, listen: false).availableProducts;

    var productData = Provider.of<Products>(context);
    var cartData = Provider.of<Cart>(context);
    var categoryData = Provider.of<Categories>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
        title: SearchBox(
          searchText: searchText,
        ),
        actions: const [
          CartIcon(),
          SizedBox(
            width: 10,
          ),
          MessageIcon(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: carouselItem.length,
              itemBuilder: (context, index, i) {
                var item = carouselItem[index];
                return carouselSingleSlider(
                  item: item,
                  context: context,
                  carouselLength: carouselItem.length,
                  currentCarouselIndex: currentCarouselIndex,
                  action: checkItOut,
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) => setState(
                  () {
                    currentCarouselIndex = index;
                  },
                ),
                height: size.height / 2,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: size.height / 5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iconSections.length,
                  itemBuilder: (context, index) {
                    var item = iconSections[index];
                    return SingleIconSection(
                      item: item,
                      index: index,
                      currentIconSectionIndex: currentCarouselIndex,
                      setCurrentIconSection: setCurrentIconSection,
                    );
                  }),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            KDotsIndicator(
              dotscount: carouselItem.length,
              position: currentCarouselIndex,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: size.height / 1.32,
              color: gridBig,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Sale Product',
                          style: getmediumStyle(
                            color: accentColor,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        Text(
                          'See more',
                          style: getmediumStyle(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height / 2 / 1,
                      child: ProductGridBuilder(
                        products: products,
                        categoriesData: categoryData,
                        productsData: productData,
                        prodLocation: ProdLocation.availableProducts,
                        cartData: cartData,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
