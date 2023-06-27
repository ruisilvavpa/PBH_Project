import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import 'book_info_card.dart';
import 'book_sinopse_card.dart';

class BookProfileBanner extends StatefulWidget {
  const BookProfileBanner({super.key});

  @override
  State<BookProfileBanner> createState() => _BookProfileBannerState();
}

class _BookProfileBannerState extends State<BookProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: const [
              Image(image: AssetImage('assets/images/teste_book_1.png')),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 180,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: writterLogoColor,
                borderRadius: BorderRadius.all(Radius.circular(29)),
              ),
              child: const Text(
                Strings.kDonationSubmit,
                style: kTitle4,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                alignment: Alignment.topCenter,
                height: 278,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(29)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 33,
                      color: kshadowcolor,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: LinearPercentIndicator(
                          alignment: MainAxisAlignment.end,
                          lineHeight: 30,
                          percent: 0.5,
                          progressColor: writterLogoColor,
                          backgroundColor:
                              const Color.fromRGBO(230, 208, 190, 1),
                          barRadius: const Radius.circular(30),
                          center: const Text(
                            'Achivement: 50%',
                            style: kTitle1,
                          ),
                        ),
                      ),
                      const BookInfoCard(
                        rating: 2.1,
                        writterName: 'Tiaguinho',
                      ),
                      const BookSinopseCard(
                          sinopse: 'Ola eu sou o Tiaguinho\n'
                              'Tou a programar isto para o projeto final\n'
                              'Ate agr isto t6a responsivo e a correr bem\n'
                              'Isto é apenas um teste\n'
                              'Para ver se da scroll ou n'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
