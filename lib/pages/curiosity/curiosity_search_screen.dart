import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:convert';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:rxdart/rxdart.dart';
import '../../models/curiosity.dart';
import '../../api/curiosity_api.dart';

/**
 * 好奇心搜索界面
 */
class CuriositySearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CuriositySearchScreenState();

}

enum LoadingState {
  DONE,
  LOADING,
  WAITING,
  ERROR
}

class _CuriositySearchScreenState extends State<CuriositySearchScreen> {
  ApiClient _apiClient = ApiClient();
  SearchBar searchBar;
  List<Questioning> _resultList = List();
  LoadingState _currentState = LoadingState.WAITING;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _textEditingController = TextEditingController();
  PublishSubject<String> querySubject = PublishSubject();

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
      title: Text('搜索'),
      actions: <Widget>[
        searchBar.getSearchAction(context)
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(() {
      querySubject.add(_textEditingController.text);
    });

    querySubject.stream.where((query) => query.isNotEmpty)
    .debounce(Duration(milliseconds: 250))
    .distinct()
    .switchMap((query) =>
      Observable.fromFuture(_apiClient.searchQuestionings(query, '', 1, 1)))
    .listen(_setResults);
  }

  void _setResults(List<Questioning> results) {
    setState(() {
      _resultList = results;
      _currentState = LoadingState.DONE;
    });
  }

  @override
  void dispose() {
    super.dispose();
    querySubject.close();
    _textEditingController.dispose();
  }

  _CuriositySearchScreenState() {
    searchBar = SearchBar(
        inBar: true,
        controller: _textEditingController,
        setState: setState,
        buildDefaultAppBar: _buildAppBar,
        onSubmitted: querySubject.add
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: _buildContentSection(),
    );
  }

  Widget _buildContentSection() {
    switch(_currentState) {
      case LoadingState.WAITING:
        return Center(child: Text('搜索结果中!'));
      case LoadingState.ERROR:
        return Center(child: Text("An error occured!"));
      case LoadingState.LOADING:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingState.DONE:
        return Container();//TODO
      default:
        return Container();
    }
  }

}