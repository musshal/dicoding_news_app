import 'dart:io';

import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/ui/article_list_page.dart';
import 'package:dicoding_news_app/ui/news_provider.dart';
import 'package:dicoding_news_app/ui/settings_page.dart';
import 'package:dicoding_news_app/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: secondaryColor,
          items: _bottomNavBarItems,
        ),
        tabBuilder: (context, index) {
          return _listWidget[index];
        },
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: "Headline",
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: "Setting",
    ),
  ];

  final List<Widget> _listWidget = [
    ChangeNotifierProvider<NewsProvider>(
      create: (_) => NewsProvider(apiService: ApiService()),
      child: const ArticleListPage(),
    ),
    const SettingsPage(),
  ];
}