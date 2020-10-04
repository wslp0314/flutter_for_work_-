//import 'package:flutter/material.dart';
//import 'package:flutterappforwork/pages/home_page.dart';
//import 'package:flutterappforwork/pages/my_page.dart';
//import 'package:flutterappforwork/pages/search_page.dart';
//import 'package:flutterappforwork/pages/travel_page.dart';
//
//class TabNavigator extends StatefulWidget {
//  @override
//  _TabNavigatorState createState() => _TabNavigatorState();
//}
//
//class _TabNavigatorState extends State<TabNavigator> {
//  int _currentIndex;
//  final PageController _controller = PageController(initialPage: 0);
//  final _defaultColor = Colors.grey;
//  final _activeColor = Colors.blue;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: PageView(
//        controller: _controller,
//        children: [
//          HomePage(),
//          SearchPage(),
//          TravelPage(),
//          MyPage(),
//        ],
//      ),
//
//      bottomNavigationBar: BottomNavigationBar(
//          currentIndex: _currentIndex,
//          onTap: (index) {
//            _controller.jumpToPage(index);
//            setState(() {
//              _currentIndex=index;
//            });
//          },
//          type:BottomNavigationBarType.fixed,
//          items:[
//            BottomNavigationBarItem(
//                icon: Icon(Icons.home,color: _defaultColor,),
//                activeIcon: Icon(Icons.home,color: _activeColor,),
//                title:Text("首页",style: TextStyle(color: _currentIndex != 0 ? _defaultColor:_activeColor),)
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.search,color: _defaultColor,),
//                activeIcon: Icon(Icons.search,color: _activeColor,),
//                title:Text("搜索",style: TextStyle(color: _currentIndex != 1 ? _defaultColor:_activeColor),)
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.camera_alt,color: _defaultColor,),
//                activeIcon: Icon(Icons.camera_alt,color: _activeColor,),
//                title:Text("旅拍",style: TextStyle(color: _currentIndex != 2 ? _defaultColor:_activeColor),)
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.account_circle,color: _defaultColor,),
//                activeIcon: Icon(Icons.account_circle,color: _activeColor,),
//                title:Text("我的",style: TextStyle(color: _currentIndex != 3 ? _defaultColor:_activeColor),)
//            ),
//          ]
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:flutterappforwork/pages/home_page.dart';
import 'package:flutterappforwork/pages/my_page.dart';
import 'package:flutterappforwork/pages/search_page.dart';
import 'package:flutterappforwork/pages/travel_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  var _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    hideScreen();
    getPackageInfo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //隐藏启动屏
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 2000), () {
      FlutterSplashScreen.hide();
    });
  }

  //退出app
  Future<bool> exitApp() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      Fluttertoast.showToast(
          msg: "再按一次退出应用",
          backgroundColor: Colors.grey,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 14);
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
    /*return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text("是否退出"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            ));*/
  }

  //获取packageInfo
  void getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print(
        'appName:$appName,packageName:$packageName,version:$version,buildNumber:$buildNumber}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              HomePage(),
              SearchPage(
//                hideLeft: true,
              ),
              TravelPage(),
              MyPage(),
            ],
            /*onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },*/
          ),
          onWillPop: exitApp),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
//          items: [
//            _bottomItem(Icons.home, '首页', 0),
//            _bottomItem(Icons.search, '搜索', 1),
//            _bottomItem(Icons.camera_alt, '旅拍', 2),
//            _bottomItem(Icons.account_circle, '我的', 3),
//          ]),
          items:[
          BottomNavigationBarItem(
          icon: Icon(Icons.home,color: _defaultColor,),
          activeIcon: Icon(Icons.home,color: _activeColor,),
          title:Text("首页",style: TextStyle(color: _currentIndex != 0 ? _defaultColor:_activeColor),)
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.search,color: _defaultColor,),
          activeIcon: Icon(Icons.search,color: _activeColor,),
          title:Text("搜索",style: TextStyle(color: _currentIndex != 1 ? _defaultColor:_activeColor),)
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt,color: _defaultColor,),
          activeIcon: Icon(Icons.camera_alt,color: _activeColor,),
          title:Text("旅拍",style: TextStyle(color: _currentIndex != 2 ? _defaultColor:_activeColor),)
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: _defaultColor,),
          activeIcon: Icon(Icons.account_circle,color: _activeColor,),
          title:Text("我的",style: TextStyle(color: _currentIndex != 3 ? _defaultColor:_activeColor),)
          ),
        ]
      )
    );
  }

  //底部导航item
  BottomNavigationBarItem _bottomItem(IconData icon, String title, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
