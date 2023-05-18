import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pbh_project/app_styles.dart';
import 'package:pbh_project/models/onboard_data.dart';
import 'package:pbh_project/size_configs.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);
  Container dotIndicator(index) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
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
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: List.generate(
                    onboardingContents.length,
                    (index) => dotIndicator(index),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class OnboardContent extends StatelessWidget {
  OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  var cores;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Image.asset(
        image,
        height: 250,
      ),
      const Spacer(),
      Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 16),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w300),
      ),
      const Spacer(),
    ]);
  }
}
