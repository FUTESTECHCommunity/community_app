import 'package:flutter/material.dart';

/**
 * 展现每一个查询结果项
 */
class CuriosityItemCard extends StatelessWidget {
  final Object item;

  CuriosityItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("", fit:BoxFit.contain),
          Row(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(16.0),
                child: new Image.asset("", width: 48.0, height: 48.0,),
              ),
              new Expanded(child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("", softWrap: false, overflow: TextOverflow.ellipsis,),
                  new Text("")
                ],
              ))
            ],
          )
        ],
      ),
    );
  }

}