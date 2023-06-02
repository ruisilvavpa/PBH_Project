import 'package:flutter/material.dart';
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
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    //Initialize size config
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 2,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 1,
                    ),
                    Container(
                      height: sizeV * 45,
                      child: Image.asset(
                        onboardingContents[index].image,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 3,
                    ),
                    Text(
                      onboardingContents[index].description,
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
                primary: Colors.white,
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                'Start Explorer',
                style: TextStyle(
                  fontFamily: 'Khepri',
                  color: Color.fromRGBO(87, 61, 28, 1),
                ),
              ),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              })
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              height: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          fontFamily: 'Khepri',
                          color: Color.fromRGBO(87, 61, 28, 1),
                        ),
                      ),
                      onPressed: () => _pageController.jumpToPage(2),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          activeDotColor: Color.fromRGBO(87, 61, 28, 1),
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontFamily: 'Khepri',
                          color: Color.fromRGBO(87, 61, 28, 1),
                        ),
                      ),
                      onPressed: () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                    ),
                  ]),
            ),
    );
  }
}
