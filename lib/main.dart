import 'package:flutter/material.dart';
import 'package:lathian_new_app/model/article.dart';
import 'package:lathian_new_app/screen/detail_page.dart';
import 'package:lathian_new_app/screen/list_page.dart';
import 'package:lathian_new_app/theme/styles.dart';
import 'package:lathian_new_app/widget/article_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.black,
                secondary: secondaryColor,
              ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: NewListPage.routeName, // halaman awal
      routes: {
        NewListPage.routeName: (context) => const NewListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ), // tambahkan route ke halaman articleDetailPage
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments
                as String) // daftarkan route navigasi
      },
    );
  }
}