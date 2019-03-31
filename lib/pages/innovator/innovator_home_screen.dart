import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//website-app 分栏目的列表
//https://github.com/HackSoul/website-app

//assets-inventory资产盘点
//https://github.com/HackSoul/assets-inventory

//Flutter 高仿知乎 UI zhihu-flutter
//https://github.com/HackSoul/zhihu-flutter/

//知乎日报的flutter版
//https://github.com/zhujian1989/ZhihuDailyPurifyByFlutter

//flutter UI框架 flukit,flukit （Flutter UI Kit）是一个Flutter Widget库,正在开发中，不稳定
//https://github.com/flutterchina/flukit

//基于Google Flutter的开源中国客户端
//https://gitee.com/yubo725/FlutterOSC

//awesome-flutter 一个很好的flutter库
//https://github.com/best-flutter/awesome-flutter
class InnovatorHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InnovatorHomeScreenState();
  }

}

class _InnovatorHomeScreenState extends State<InnovatorHomeScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 7,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: new Text('创意'),
            centerTitle: true,
            bottom: new TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs:<Widget>[
                  new Tab(text: '科技'),
                  new Tab(text: '人文'),
                  new Tab(text: '艺术'),
                  new Tab(text: '商业模式'),
                  new Tab(text: '工艺'),
                  new Tab(text: '产品'),
                  new Tab(text: '运营')
                ],
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(CupertinoIcons.search, color: Colors.blue,),
                onPressed: () {
                  showSearch(context: context, delegate: SearchBarDelegate());
                }
              ),
              new IconButton(
                  icon: new Icon(CupertinoIcons.add, color: Colors.blue,),
                  onPressed: (){
                    //TODO
                  }
              )
            ],
          ),
          body: new TabBarView(
              children: <Widget>[
                new Center(
                  child: new Container(color: Colors.blue,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                ),
                new Center(
                  child: new Container(color: Colors.grey,),
                )
              ]
          ),
        )
    );
  }

}

//搜索
class SearchBarDelegate extends SearchDelegate<String> {
  final searchList = [
    "ChengDu",
    "ShangHai",
    "BeiJing",
    "TianJing",
    "NanJing",
    "ShenZheng"
  ];

  final recentSuggest = [
    "suggest1",
    "suggest2"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
        ));
  }
}



