import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../widgets/topic/expansion_title_widget.dart';

//[Flutter Widget]ExpansionTile 二级菜单
//https://cloud.tencent.com/developer/article/1354686

//教育学院

class CommunityHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommunityHomeScreenState();
  }

}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {

  Future<List<TopicCategory>> _getCategoryList() async{
    List<TopicCategory> categories = [];
    List<Topic> topics1 = [
      Topic(name: 'OKR', url: 'okr', description: '', iconUrl: ''),
      Topic(name: 'TRIZ', url: 'triz', description: '', iconUrl: '')
    ];
    categories.add(TopicCategory(name: '创新思维与方法', description: '', topics: topics1));

    List<Topic> topics2 = [
      Topic(name: '产品', url: 'product', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: '')
    ];
    categories.add(TopicCategory(name: '成果展示', description: '', topics: topics2));

    List<Topic> topics3 = [
      Topic(name: '产品', url: 'product', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: ''),
      Topic(name: '科研成果', url: 'research', description: '', iconUrl: '')
    ];
    categories.add(TopicCategory(name: '其他', description: '', topics: topics3));
    await new Future.delayed(new Duration(seconds: 5));
    return categories;
  }

  Future<Null> loadData() async {
    await _getCategoryList();
    if(!mounted)
      return;
    setState(() {
      //什么都不做，只为触发RefreshIndicator的子控件刷新
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        child: new FutureBuilder(
            future: _getCategoryList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return new Center(
//                    child: new Card(
//                      child: new Text('loading...'),
//                    ),
                    child: new CircularProgressIndicator(),
                  );
                default:
                  if(snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return createTopicCategories(snapshot.data);
              }
            }
        ),
        onRefresh: loadData,
    );
    return new FutureBuilder(
        future: _getCategoryList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Press button to start');
            case ConnectionState.waiting:
              return new Text('Awaiting result...');
            default:
              if(snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createTopicCategories(snapshot.data);
          }
//          if(snapshot.hasError) {
//            return new Text('Error:${snapshot.error}');
//          }else {
//            return createTopicCategories(snapshot.data);
//          }
        }
    );
  }

  Widget createTopicCategories(List<TopicCategory> categories) {
    return new ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index){
          return new ExpansionTileWidget(category: categories[index]);
        }
    );
  }

}