import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_news_app/screen/article_list_page.dart';
import 'package:latihan_news_app/screen/setting_page.dart';
import 'package:latihan_news_app/theme/styles.dart';
import 'package:latihan_news_app/widgets/platform_widget.dart';

import 'article_detail_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  // Index untuk bottom navigation bar untuk membuat navigasi ke halaman baru
  final List<Widget> _listWidget = const [
    ArticleListPage(),
    SettingPage(),
  ];
  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOs,
    );
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

  Widget _buildIOs(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: secondaryColor,
          items: _bottomNavBarItems,
        ),
        tabBuilder: (context, index) {
          return _listWidget[index];
        });
  }
}
