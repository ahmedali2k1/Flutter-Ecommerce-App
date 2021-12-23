import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/chewie_list_item.dart';
import 'package:ecommerceapp/config/models/category_model.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:ecommerceapp/config/theme.dart';
import 'package:ecommerceapp/widgets/custom_appbar.dart';
import 'package:ecommerceapp/widgets/custom_navbar.dart';
import 'package:ecommerceapp/widgets/section_title.dart';
import 'package:ecommerceapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:ecommerceapp/widgets/hero_carousel_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: 'ＣＯＭＰＬＥＸＩＴＹ'),
        bottomNavigationBar: customNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.black,
                  child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: Category.categories
                          .map((Category) =>
                              HeroCarouselCard(category: Category))
                          .toList())),
              CarouselSlider(
                  items: [
                    ChewieListItem(
                        videoPlayerController: VideoPlayerController.asset(
                            'assets/video/complexity.mp4'),
                        looping: true)
                  ],
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  )),
              SizedBox(
                height: 10,
              ),
              SectionTitle(title: 'ＲＥＣＯＭＭＥＮＤＥＤ'),
              ProductCarousel(
                  products: Product.products
                      .where((Product) => Product.isRecommended)
                      .toList()),
              SectionTitle(title: 'ＢＥＳＴ ＳＥＬＬＥＲ'),
              ProductCarousel(
                  products: Product.products
                      .where((Product) => Product.isPopular)
                      .toList())
            ],
          ),
        ));
  }
}
