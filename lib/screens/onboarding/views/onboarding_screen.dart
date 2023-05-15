import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color.fromRGBO(191, 229, 192, 1),
            child: OnboardContent(
              image: 'assets/images/mainlogo.jpg',
              title:
                  'Um lugar que te ajudará a alcançar um futuro na carreira de escritor!',
              description:
                  'Transforma o teu sonho em realidade e publica as tuas obras com facilidade através de nossa aplicação, a plataforma perfeita para te ajudar a compartilhar as tuas primeiras obras e dar-te a conhecer ao mundo!',
            ),
          ),
          Container(
            color: Color.fromRGBO(235, 178, 125, 1),
            child: OnboardContent(
              image: 'assets/images/writterlogo.jpg',
              title:
                  'Um lugar que te ajudará a alcançar um futuro na carreira de escritor!',
              description:
                  'Transforma o teu sonho em realidade e publica as tuas obras com facilidade através de nossa aplicação, a plataforma perfeita para te ajudar a compartilhar as tuas primeiras obras e dar-te a conhecer ao mundo!',
            ),
          ),
          Container(
            color: Color.fromRGBO(138, 210, 224, 1),
            child: OnboardContent(
              image: 'assets/images/userlogo.jpg',
              title:
                  'Um lugar que te ajudará a alcançar um futuro na carreira de escritor!',
              description:
                  'Transforma o teu sonho em realidade e publica as tuas obras com facilidade através de nossa aplicação, a plataforma perfeita para te ajudar a compartilhar as tuas primeiras obras e dar-te a conhecer ao mundo!',
            ),
          ),
        ],
      ),
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
