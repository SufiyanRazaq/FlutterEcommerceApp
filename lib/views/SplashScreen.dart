import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Assets.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/Padding.dart';
import 'package:flutterecommerceapp/ResourcesItems/String.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';
import 'package:flutterecommerceapp/Widgets/SmoothIndicator.dart';
import 'package:flutterecommerceapp/models/SplashItem.dart';
import 'package:flutterecommerceapp/routes/routeHelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  var currentPageIndex = 0;

  void skipSlides() {
    _pageController.animateToPage(2,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  void nextSlides() {
    currentPageIndex != 2
        ? _pageController.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
          )
        : Navigator.of(context).pushNamed(RouteHelper.mainScreen);
  }

  List<SplashItem> splashItem = [
    SplashItem(
      title: StringManager.splashTitle1,
      subTitle: StringManager.splashSubtitle1,
      imgUrl: AssetManager.splashImage1,
    ),
    SplashItem(
      title: StringManager.splashTitle2,
      subTitle: StringManager.splashSubtitle2,
      imgUrl: AssetManager.splashImage2,
    ),
    SplashItem(
      title: StringManager.splashTitle3,
      subTitle: StringManager.splashSubtitle3,
      imgUrl: AssetManager.splashImage3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          currentPageIndex != splashItem.length - 1
              ? TextButton(
                  onPressed: () => skipSlides(),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: accentColor,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        itemCount: splashItem.length,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(splashItem[index].imgUrl),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              splashItem[index].title,
              style: getBoldStyle(
                fontSize: FontSize.s30,
                color: accentColor,
              ),
            ),
            Text(
              splashItem[index].subTitle,
              style: getLightStyle(
                fontSize: FontSize.s20,
                color: accentColor,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSmoothIndicator(
              pageController: _pageController,
              itemCount: splashItem.length,
              color: primaryColor,
            ),
            ElevatedButton(
              onPressed: () => nextSlides(),
              child: Text(
                currentPageIndex != splashItem.length - 1
                    ? 'Next'
                    : 'Start Exploring',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
