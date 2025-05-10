import 'package:flutter/material.dart';
import '../../domain/entities/article.dart'; // Import your Article entity or model

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments;

    // Safely check and cast
    if (article is! Article) {
      return const Scaffold(
        body: Center(child: Text('Invalid article data')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(article.body),
      ),
    );
  }
}
