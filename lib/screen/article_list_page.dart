import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_news_app/theme/styles.dart';
import 'package:latihan_news_app/widgets/platform_widget.dart';
import '../model/article.dart';
import 'article_detail_page.dart';

class ArticleListPage extends StatefulWidget {
  static const routeName = '/article_list';
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOs,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIOs(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        /*agar setiap kita membuka tab dengan navigation bar tersebut tidak membuat route atau halaman baru. Tujuannya adalah agar tidak ada tag hero yang duplikat karena ada halaman baru.*/
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }
}

FutureBuilder<String> _buildList(BuildContext context) {
  return FutureBuilder(
    future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      final List<Article> articles = parsedArticle(snapshot.data);
      // panggil fungsi patrseArcilce()
      // setelah mendapatkan daftar article, widget  ListView
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

// buat method baru untuk manampilkan widget dari masing2 article
/* Saat menjalankan aplikasi pada perangkat iOS, layar akan berwarna merah dan menunjukkan eror. Kenapa demikian? Itu karena Anda menggunakan widget ListTile. Widget ini merupakan bagian dari library material design sehingga memerlukan parent berupa material widget. Sebagai solusi sementara, Anda dapat membungkus widget ListTile ke dalam widget Material agar mendapatkan parent dari library material.*/
Widget _buildArticleItem(BuildContext context, Article article) {
  return Material(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        // animasi hero
        tag: article.urlToImage,
        child: Image.network(
          article.urlToImage,
          width: 100,
        ),
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);
      },
    ),
  );
}
