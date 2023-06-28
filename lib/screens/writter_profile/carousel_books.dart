import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/app_styles.dart';
import '../book_profile_page/book_profile_banner.dart';
import 'book_card_finalizado.dart';

class CarouselBooks extends StatefulWidget {
  const CarouselBooks({super.key});

  @override
  State<CarouselBooks> createState() => _CarouselBooksState();
}

class _CarouselBooksState extends State<CarouselBooks> {
  int activeIndex = 0;
  final urlImages = [
    'assets/images/teste_book_1.png',
    'assets/images/assortment-with-books-dark-background.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                  height: 210.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              itemCount: urlImages.length,
              itemBuilder: (context, index, realindex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              }),
          const SizedBox(height: 9),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BookProfileBanner()));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: const BookCardFinalizado(),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const SlideEffect(
          dotColor: Colors.black12,
          activeDotColor: writterLogoColor,
        ),
      );
}
