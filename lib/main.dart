import 'package:dicoding_news_app/article.dart';
import 'package:dicoding_news_app/article_web_view.dart';
import 'package:dicoding_news_app/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_news_app/news_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article
        ),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String
        )
      }
    );
  }
}