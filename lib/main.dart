import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid_app/fonts/my_icon.dart';
import 'package:flutter_wanandroid_app/home/home.dart';
import 'package:flutter_wanandroid_app/navigation/navigation.dart';
import 'package:flutter_wanandroid_app/project/project.dart';
import 'package:flutter_wanandroid_app/public/offical.dart';
import 'package:flutter_wanandroid_app/system/system.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          primaryColorBrightness: Brightness.dark,
          primaryColorDark: Colors.blue),
      home: MyMainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  final _titles = ["Wan Android", "导航", "体系", "项目", "公众号"];
  final PageController _pageController = PageController();

  final _pages = [
    HomePage(),
    NavigationPage(),
    SystemPage(),
    ProjectPage(),
    WechatPublicPage()
  ];

  _onTabTap(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
    setState(() {
      _currentTab = index;
    });
    // if (_currentTab == 0) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ));
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.blue,
    //   ));
    // }
    _pageController.jumpToPage(index);
  }

  bool _showElevation() {
    return _currentTab == _titles.length - 1 ||
        _currentTab == _titles.length - 2;
  }

  bool _showAppbar() {
    return _currentTab != 0;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: PreferredSize(
      //   child: AppBar(
      //     // Here we take the value from the MyHomePage object that was created by
      //     // the App.build method, and use it to set our appbar title.
      //     title: Text(_titles[_currentTab]),
      //     actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      //     elevation: _showElevation() ? 0 : 4,
      //    backgroundColor: _currentTab==0?Colors.transparent:Colors.blue,
      //   ),
      //   preferredSize: Size(double.infinity, _showAppbar() ? 48 : 0),
      // ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
        controller: _pageController,
      ),
      drawer: Drawer(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        style: TabStyle.react,
        activeColor: Colors.white,
        // color: Colors.black,
        onTap: _onTabTap,
        initialActiveIndex: _currentTab,
        items: [
          TabItem(icon: Icons.home, title: '首页'),
          TabItem(icon: Icons.navigation, title: _titles[1]),
          TabItem(icon: Icons.article, title: _titles[2]),
          TabItem(icon: MyIcon.project, title: _titles[3]),
          TabItem(icon: MyIcon.wechat_public, title: _titles[4])
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
