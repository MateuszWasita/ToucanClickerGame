import 'package:toucan_clicker/home_page.dart';
import 'package:toucan_clicker/shop_page.dart';
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}
PageController pageController = PageController();


class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        HomePage(),
        ShopPage()
      ],
    );
  }
}