import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/utils/app_styles.dart';
import 'package:pbh_project/models/onboard_data.dart';
import 'package:pbh_project/screens/login/login_page.dart';
import 'package:pbh_project/utils/size_configs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //variables
  final PageController _pageController = PageController(initialPage: 0);
  bool isLastPage = false;
  List<OnBoarding> _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('resources/onboarding.json');
    final data = await json.decode(response);

    setState(() {
      List<dynamic> newItems = data["items"];
      _items = newItems.map<OnBoarding>((item) {
        return OnBoarding(
            title: item['title'],
            image: item['image'],
            description: item['description']);
      }).toList();
    });
  }

  int lastIndex() {
    return _items.length - 1;
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    //Initialize size config
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 80),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == lastIndex());
                },
                itemCount: _items.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 2,
                    ),
                    Text(
                      _items[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 1,
                    ),
                    SizedBox(
                      height: sizeV * 45,
                      child: Image.asset(
                        _items[index].image,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 3,
                    ),
                    Text(
                      _items[index].description,
                      style: kBodyText1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                foregroundColor: kBackgroundColor,
                backgroundColor: kBackgroundColor,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                Strings.kStartExplorer,
                style: kOnboardingAction,
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      Strings.kSkip,
                      style: kOnboardingAction,
                    ),
                    onPressed: () => _pageController.jumpToPage(lastIndex()),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _items.length,
                      effect: const WormEffect(
                        spacing: 16,
                        activeDotColor: Color.fromRGBO(87, 61, 28, 1),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      Strings.kNext,
                      style: kOnboardingAction,
                    ),
                    onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                  ),
                ],
              ),
            ),
    );
  }
}
