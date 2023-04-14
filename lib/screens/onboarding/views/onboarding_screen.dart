import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: OnboardContent(),
    ));
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Image.asset(
        'assets/images/publishing.jpg',
        height: 250,
      ),
      const Spacer(),
      Text(
        'Um lugar que te ajudará a alcançar um futuro na carreira de escritor!',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        'Transforma o teu sonho em realidade e publica as tuas obras com facilidade através de nossa aplicação, a plataforma perfeita para te ajudar a compartilhar as tuas primeiras obras e dar-te a conhecer ao mundo!',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      const Spacer(),
    ]);
  }
}
