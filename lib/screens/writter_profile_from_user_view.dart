import 'package:flutter/material.dart';

class WriterProfileFromUserView extends StatefulWidget {
  const WriterProfileFromUserView({super.key});

  @override
  _WriterProfileFromUserViewState createState() =>
      _WriterProfileFromUserViewState();
}

class _WriterProfileFromUserViewState extends State<WriterProfileFromUserView> {
  bool showRating = false;
  TextEditingController biographyController =
      TextEditingController(text: 'About Me');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Lógica para executar o logout
              // ...
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                const SizedBox(height: 10),
                const Text(
                  'author name',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {
                    setState(() {
                      showRating = true;
                    });
                  },
                ),
                if (showRating)
                  // Widget de estrelas de avaliação
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Biography:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // spacer bewtween images
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Número de imagens
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Image.asset(
                          'assets/imagesloginbtn.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Image $index',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
