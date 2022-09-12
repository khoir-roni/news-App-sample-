import 'package:flutter/material.dart';
import '../model/article.dart';
import 'detail_page.dart';

class NewListPage extends StatelessWidget {
  static const routeName = '/article_list';
  const NewListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New App'),
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final List<Article> articles =
              parsedArticle(snapshot.data); // panggil fungsi patrseArcilce()
          // setelah mendapatkan daftar article, widget  ListView
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }

// buat method baru untuk manampilkan widget dari masing2 article
  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);
      },
    );
  }
}
