import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './curiosity/curiosity_home_screen.dart';
import './innovator/innovator_home_screen.dart';
import './community/community_home_screen.dart';
import './profile/profile_screen.dart';

//流式布局Warp
//Tooltip
//https://cloud.tencent.com/developer/article/1354688

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home> {
//  final bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  Widget _currentScreen;
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: new Icon(IconData(0xf446, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
      title: new Text('好奇心')//想象力、创造性 阅读能力、理解能力、质疑能力、提问能力
    ),
    new BottomNavigationBarItem(
        icon: new Icon(IconData(0xf452, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
        title: new Text('创意')
    ),
    new BottomNavigationBarItem(
        icon: new Icon(IconData(0xf448, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
        title: new Text('社区')
    ),
    new BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.profile_circled),
        title: new Text('我的')
    )
  ];
  List<Widget> _tabBodies = <Widget>[
    new CuriosityHomeScreen(),
    new InnovatorHomeScreen(),
    new CommunityHomeScreen(),
    new ProfileScreen()
  ];

  @override
  void initState() {
//    _widgets..add(ThinkerScreen())
//    ..add(InnovatorScreen())
//    ..add(CommunityScreen())
//    ..add(ProfileScreen());
//    print('Home widget开始绘制!');
    super.initState();
    _currentScreen = _tabBodies[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('未来家'),
//      ),
      body: _currentScreen,
      bottomNavigationBar: BottomNavigationBar(
          items: _bottomTabs,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState((){
              _currentIndex = index;
              _currentScreen = _tabBodies[_currentIndex];
            });
          },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}