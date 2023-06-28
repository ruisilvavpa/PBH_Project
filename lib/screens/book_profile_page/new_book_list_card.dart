import 'package:flutter/material.dart';
import 'package:pbh_project/screens/book_profile_page/two_side_rounded_buttom.dart';

import '../../utils/app_styles.dart';
import 'book_rating.dart';

class BookListCard3 extends StatefulWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetails;
  final Function pressDonate;
  const BookListCard3(
      {Key? key,
      required this.image,
      required this.title,
      required this.auth,
      required this.rating,
      required this.pressDetails,
      required this.pressDonate})
      : super(key: key);

  @override
  State<BookListCard3> createState() => _BookListCard3State();
}

class _BookListCard3State extends State<BookListCard3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, bottom: 40),
      height: 141,
      width: double
          .infinity, // Alteração: Define a largura para preencher todo o espaço disponível
      child: Stack(
        children: [
          Container(
            height: 300,
            width: double
                .infinity, // Alteração: Define a largura para preencher todo o espaço disponível
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 33,
                  color: kshadowcolor,
                ),
              ],
            ),
          ),
          Image.asset(
            widget.image,
            width: double
                .infinity, // Alteração: Define a largura para preencher todo o espaço disponível
            fit: BoxFit
                .cover, // Alteração: Redimensiona a imagem para caber no espaço disponível
          ),
          Positioned(
            top: 10,
            right:
                10, // Alteração: Ajusta a posição do ícone "Favorite" e do BookRating
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                BookRating(score: widget.rating),
              ],
            ),
          ),
          Positioned(
            bottom: 10, // Alteração: Ajusta a posição do título, autor e botões
            left: 10, // Alteração: Ajusta a posição do título, autor e botões
            right: 10, // Alteração: Ajusta a posição do título, autor e botões
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.auth,
                  style: const TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.pressDetails(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: const Text('Details'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TwoSidesRoundedButtom(
                        text: 'Donate',
                        radious: 29,
                        press: widget.pressDonate(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
