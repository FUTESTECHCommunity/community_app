import 'package:flutter/material.dart';
import 'dart:async';

//提示
void showMessage(BuildContext context, String content) {
  showDialog<Null>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('确定'))
          ],
        );
      }
  );
}

class ShowProgress extends StatefulWidget {
  final Future<Null> requestCallback;
  
  ShowProgress(this.requestCallback);

  @override
  State<StatefulWidget> createState() {
    return _ShowProgressState();
  }
}

class _ShowProgressState extends State<ShowProgress> {
  @override
  void initState() {
    super.initState();
//下面两段代码都出问题
//    var timer;
//    timer = new Timer(new Duration(milliseconds: 1000), () {
//      print("timer?");
//      widget.requestCallback.then((dynamic onValue) {
////        (timer as Timer).cancel();
//        Navigator.of(context).pop(onValue);
//      });
//    });

//    Future.delayed(Duration(milliseconds: 2000), () {
//      widget.requestCallback.then((dynamic onValue) {
//        Navigator.of(context).pop(onValue);
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}