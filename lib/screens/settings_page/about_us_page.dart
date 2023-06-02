import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome to our platform!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Our application was created with the purpose of providing a dedicated space for writers to publish their books and help them raise funds to launch their careers. A portion of the funds received will also be used to support nonprofit organizations chosen by the writers themselves.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'By using our platform, writers have the opportunity to showcase their literary works and reach a wider audience. We aim to empower talented writers by providing them with a platform to share their stories and receive financial support from generous readers and supporters. With their contributions, readers not only support their favorite writers but also contribute to important social causes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our application offers a complete experience for users. You can connect to the platform, explore writers\' profiles, and discover their published works. Users have the freedom to choose which writer they want to support based on their literary preferences and the social impact they wish to make. Additionally, you can learn more about the nonprofit organization that the writer is supporting, expanding your knowledge and contributing to important social causes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'We are committed to creating a welcoming and promising environment for writers and readers alike. We value the connection between writers and their supporters, as well as the positive social impact we can make together. Join us on this journey, discover new literary talents, support writers, and make a difference in their lives and the causes we believe in.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for being part of our community!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
