import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'FAQ\'s'),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index].question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(faqs[index].answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ(this.question, this.answer);
}

List<FAQ> faqs = [
  FAQ(
    'Question 1: How can I publish my book on the platform?',
    'Answer 1: To publish your book, you need to create a writer account on our platform. Once you log in, you can access the publishing section and provide the necessary information about your book, such as title, synopsis, category, and other relevant details. You can then submit your book for review, and once approved, it will be available to readers on the platform.',
  ),
  FAQ(
    'Question 2: Can I choose the nonprofit organization I want to support with the funds raised?',
    'Answer 2: Yes, you have the freedom to choose the nonprofit organization you want to support with a portion of the funds raised from the sale of your books. During the setup process of your writer account, you will have the option to select an organization from our list of partners or suggest a new organization to be considered.',
  ),
  FAQ(
    'Question 3: How can readers find the books by writers?',
    'Answer 3: Readers can discover the books by writers by browsing the platform. They can use search filters by category, author\'s name, or book title to find specific works. Additionally, the writer profiles showcase a list of their published works, allowing readers to explore and choose the books they want to read or support.',
  ),
  FAQ(
    'Question 4: Can I rate and review books and writers on the platform?',
    'Answer 4: Yes, we encourage readers to rate and review the books and writers they enjoy. You can leave a rating and comment about the book after reading it, as well as evaluate the quality and experience with the writer. These reviews help other readers make informed decisions and are valuable for writers to receive feedback on their work.',
  ),
  FAQ(
    'Question 5: Is there a wishlist feature on the platform?',
    'Answer 5: Yes, readers can add books they wish to read or support to their wishlist. This allows them to easily keep track of the books that caught their attention and the writers they want to follow. The wishlist can be accessed in the user profile and can be updated at any time.',
  ),
];
