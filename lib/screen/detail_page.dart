//menampilkan detail dari artikle  yang di pilih

import 'package:flutter/material.dart';
import 'package:lathian_new_app/model/article.dart';
import 'package:lathian_new_app/widgets/article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.description),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              article.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text('Date: ${article.publishedAt}'),
            const SizedBox(
              height: 10,
            ),
            Text('Date: ${article.author}'),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              article.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ArticleWebView.routeName,
                    arguments: article.url);
              },
              child: const Text('Read more'),
            ) // naviasi ketika tombol read more di klik akan menuju article web view
          ],
        ),
      ),
    );
  }
}
