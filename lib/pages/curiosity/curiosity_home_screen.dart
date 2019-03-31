import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './curiosity_edit_screen.dart';
import './curiosity_search_screen.dart';
import '../../models/curiosity.dart';
import '../../api/curiosity_api.dart';
import 'dart:async';

class CuriosityHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CuriosityHomeScreenState();
  }

}

class _CuriosityHomeScreenState extends State<CuriosityHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Questioning> _items = [];
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
  final ApiClient _apiClient = ApiClient();
  int page = 0;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    _getMoreData();//初次调用
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
      centerTitle: true,
      title: new Text('今天你提问了吗?'),
      actions: <Widget>[
        IconButton(
          icon:Icon(CupertinoIcons.search, color: Colors.blue,),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return CuriositySearchScreen();
                  }),
            );
          },
        ),
        IconButton(
          icon:Icon(CupertinoIcons.pen, color: Colors.blue,),
          onPressed: (){
            Navigator.of(context).push(
              PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return CuriosityEditScreen(questioning:new Questioning());
                  }),
            );
          },
        )
      ],
    );
  }

  Future<Null> _refresh() async {
    _items.clear();
    try {
      List<Questioning> items = await _apiClient.popularQuestionings(1, 10);
      page = 1;
      if(this.mounted) {
        setState(() {
          _items = items;
        });
      }
    } catch(e) {}
    return null;
  }

  _getMoreData() async {
    if(!isLoading) {
      if(this.mounted) {
        setState(() {
          isLoading = true;
        });
      }
      List<Questioning> newEntries = await _apiClient.popularQuestionings(page + 1, pageSize);
      if(newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent;
        if(offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }else {
        page = page + 1;
      }
      if(this.mounted) {
        setState(() {
          _items.addAll(newEntries);
          isLoading = false;
        });
      }
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      key: _scaffoldKey,
      body: new Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          onRefresh: _refresh,
          child: ListView.builder(
            itemCount: _items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if(index == _items.length) {
                return _buildProgressIndicator();
              } else {
//                return ListTile(title: new Text("Number " + _items[index].id.toString()));
                return _buildQuestioning(_items[index]);
              }
            },
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

  /**
   * 构建每个列表项
   */
  Widget _buildQuestioning(Questioning questioning) {
    //包含图片
    if(questioning.images != null && questioning.images.length > 0) {
      if(questioning.images.length == 1) {//一张图片

      }else if(questioning.images.length == 2) {//两张图片

      }else{//三张或三张以上

      }
    }else{//没有图片
      return new Card(

      );
    }
    return null;
  }

}