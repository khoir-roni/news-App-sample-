// widget yang akan menampilkan detail article

import 'package:flutter/material.dart';
import 'package:latihan_news_app/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const ArticleWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      //gunakan customscaffold
      body: WebView(
        initialUrl: url,
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('News App'),
    //   ),
    //   body: WebView(
    //     initialUrl: url,
    //   ),
    // );
  }
}
