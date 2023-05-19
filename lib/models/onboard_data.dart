import 'package:pbh_project/models/enums/type_account.dart';

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

class Account {
  String _name = '';
  String _email = '';
  String _password = '';
  Type _type = Type.writter;

  String get name => _name;
  set name(value) => _name = value;

  String get email => _email;
  set email(value) => _email = value;

  String get password => _password;
  set password(value) => _password = value;

  Type get type => _type;
  set type(value) => _type = value;
}
