import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Whishlist'),
      body: ListView.builder(
        itemCount: 5, // Defina o número de itens na sua lista de desejos
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://example.com/images/book_cover.jpg'), // Substitua pela imagem do livro
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text(
                  'Nome do Livro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Autor do Livro'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Adicione a função de remoção do item da lista de desejos
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
