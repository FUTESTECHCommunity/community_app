import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import './zefyr_edit_screen.dart';
import '../../models/curiosity.dart';
import 'package:notus/convert.dart';

class CuriosityEditScreen extends StatefulWidget {
  final Questioning questioning;

  CuriosityEditScreen({Key key, @required this.questioning}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _CuriosityEditScreenState();
  }

}

class _CuriosityEditScreenState extends State<CuriosityEditScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ZefyrController _controller;
  TextEditingController _summaryController;
  TextEditingController _tagsController;
  FocusNode _focusNode = new FocusNode();
  bool _validSummary = true;

  @override
  void initState() {
    super.initState();
    _controller = ZefyrController(NotusDocument());
    _summaryController = new TextEditingController(text: widget.questioning.summary.isNotEmpty ? widget.questioning.summary : "");
    _tagsController =  new TextEditingController(text: widget.questioning.tags.isNotEmpty ? widget.questioning.tags.join(",") : "");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _summaryController.dispose();
    _tagsController.dispose();
  }

//  bool _editing = false;

//  void _startEditing() {
//    setState(() {
//      _editing = true;
//    });
//  }
//
//  void _stopEditing() {
//    String mk = notusMarkdown.encode(_controller.document.toDelta());
//    print(mk);
//    print(_controller.document.toString());
//    print(_controller.document.toDelta());
//    print(_controller.document.toJson());
//    print(_controller.document.toPlainText());
//    setState(() {
//      _editing = false;
//    });
//  }

  void _checkInput() {

  }

  void _handleSubmitted() {
    FocusScope.of(context).requestFocus(new FocusNode());
    _checkInput();
    if (_summaryController.text == '') { //||
//      showMessage(context, "");
      return;
    } else if (!_validSummary) {
//      showMessage(context, "摘要的格式不正确!");
      return;
    }
    showDialog(context: context,
      barrierDismissible: false,
//      child: new ShowAwait(
//
//      )
    );
  }

  Future<int> _newCuriosity(String content, String mdContent, String summary, String tags) async {
    //用户的个人信息？
//    return ...then((int _id){
//
//    })
  }

  @override
  Widget build(BuildContext context) {
   final form = ListView(
     key: _scaffoldKey,
     children: <Widget>[
       buildEditor(),
       TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: '摘要',
          ),
          maxLength: 100,
       ),
       TextField(
         decoration: InputDecoration(
           hintText: '\',\'分隔',
           labelText: '标签',
         ),
         maxLength: 50,
       ),
       new FlatButton(
           onPressed: () {
             _handleSubmitted();
           },
           child: new Container(
             height: 30,
             decoration: new BoxDecoration(
               color: Theme.of(context).buttonColor,
             ),
             child: new Center(
               child: new Text('提交', textScaleFactor: 1.1, style: new TextStyle(color: Theme.of(context).primaryColor),),
             ),
           )
       ),
     ],
   );

//   final done = _editing
//       ? [new FlatButton(onPressed: _stopEditing, child: Text('完成'))]
//       : [new FlatButton(onPressed: _startEditing, child: Text('编辑'))];
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.grey.shade200,
        brightness: Brightness.light,
        title: ZefyrLogo(),
//        actions: done,
      ),
      body: ZefyrScaffold(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: form,
        ),
      ),
    );
  }

  Widget buildEditor() {
    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        height: 400.0,
        decoration: InputDecoration(labelText: '提问'),
        controller: _controller,
        focusNode: _focusNode,
        autofocus: false,
        imageDelegate: new CustomImageDelegate(),
        physics: ClampingScrollPhysics(),
      ),
    );
  }

}