//https://pub.dartlang.org/packages/dio
//https://pub.dartlang.org/packages/flutter_markdown
//https://pub.dartlang.org/packages/flutter_webview_plugin
import 'dart:io';
import '../models/curiosity.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;

class ApiClient {
  static final String HTTPS_BASEURL = "https://192.168.1.12:8080";
  dio.Dio instance;

  ApiClient() {
    instance = new dio.Dio();
//    instance.options.baseUrl = HTTPS_BASEURL;
    instance.options.baseUrl = "http://192.168.1.12:8080";
    instance.options.connectTimeout = 5000; //5s
    instance.options.receiveTimeout = 5000;
    instance.options.headers = {
      'user-agent': 'dio'
    };
  }
  /**
   * 分页查询获取查询结果
   */
  Future<List<Questioning>> searchQuestionings(String keyWords, String orderBy, int pageNum, int pageSize) async{
    //TODO
    Future.delayed(Duration(milliseconds: 200));
    return new List<Questioning>();
  }

  Future<List<Questioning>> popularQuestionings(int pageNum, int pageSize) async {
    dio.Response response = await instance.get("/graphql", data: {
      'query': '{findOneQuestioning(id:1){id,content,tags}}'
    });
    print(response.data);
    //TODO
    await Future.delayed(Duration(milliseconds: 500));
    List<Questioning> results = new List<Questioning>();
    int init = (pageNum-1) * pageSize;
    for(int i= 1; i < 11; i++) {
      results.add(Questioning(
        id:i+init,
        content: '',
        mdContent: '',
        summary: '',
        images:[],
        tags:[],
        created:'',
        vote:VoteSummarizing(
          percent191:10,
          percent382: 10,
          percent500: 10,
          percent618: 10,
          percent809: 10,
          excellent: 10
        ),
        author:Author(
          name: '',
          userId: 1,
          avatar: '',
          pubKey: ''
        ),
        comments: [
          Comment(
            id:1,
            author: Author(
              name:'',
              userId: 2,
              avatar: '',
              pubKey: ''
            ),
            content: '',
            mdContent: '',
            up: 1,
            down: 1,
            subs: []
          )
        ]
      ));
    }
    return results;
  }
}