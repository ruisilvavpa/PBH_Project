import 'package:pbh_project/models/type_account.dart';

class OnBoarding {
  final String title;
  final String image;
  final String description;

  OnBoarding(
      {required this.title, required this.image, required this.description});
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title:
        'Empowering Words: Supporting a Writer\'s Dream and Making a Difference',
    image: 'assets/images/publishing.jpg',
    description:
        'Turn your dream into reality and publish your works easily through our application, the perfect platform to help you share your first works and make yourself known to the world!',
  ),
  OnBoarding(
    title: 'Discover Emerging Writers and Support Social Causes!',
    image: 'assets/images/visualize.jpg',
    description:
        'Discover literary talents and be the boost they need to take off in their careers!',
  ),
  OnBoarding(
    title: 'Unleashing Words, Changing Worlds!',
    image: 'assets/images/help.jpg',
    description:
        'Join us and make a difference: Help writers and institutions through our app!',
  ),
];
