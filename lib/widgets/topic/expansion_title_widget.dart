import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopicCategory {
  String name;
  String description;
  List<Topic> topics;

  TopicCategory({this.name, this.description, this.topics});
}

class Topic {
  String name;
  String description;
  String url;
  String iconUrl;

  Topic({this.name, this.description, this.url, this.iconUrl});
}


class ExpansionTileWidget extends StatefulWidget {
  final TopicCategory category;

  ExpansionTileWidget({Key key, @required this.category}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _ExpansionTileWidgetState(category);
  }

}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> with SingleTickerProviderStateMixin {
  final TopicCategory category;
  Animation animation;
  AnimationController animationController;

  _ExpansionTileWidgetState(this.category);

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new Tween(begin: 0.0, end: 0.5).animate(animationController);
  }

  _changeOpacity(bool expand) {
    setState(() {
      if (expand) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(category.name),
      //              backgroundColor: ,
      initiallyExpanded: false,
//          leading: Icon(
//            Icons.whatshot,
//            color: Colors.redAccent,
//          ),
      trailing: RotationTransition(
        turns: animation,
        child: const Icon(Icons.chevron_right),
      ),
      onExpansionChanged: (bool) {
        _changeOpacity(bool);
      },
      children: <Widget>[
        TopicsWrapWidget(category.topics),
      ],
    );
  }
}

class TopicsWrapWidget extends StatelessWidget {
  final List<Topic> topics;

  TopicsWrapWidget(this.topics);

  @override
  Widget build(BuildContext context) {
    List<TopicButton> buttons = [];
    for(Topic topic in topics) {
      buttons.add(TopicButton(topic));
    }
    return new Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      children: buttons,
    );
  }

}

class TopicButton extends StatelessWidget {
  final Topic topic;
  TopicButton(this.topic);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: OutlineButton(
        borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
            style: BorderStyle.solid
        ),
        disabledBorderColor: Colors.grey,
        highlightedBorderColor: Colors.redAccent,
        onPressed: () {
          //TODO
          Scaffold.of(context).showSnackBar(
              new SnackBar(
                content: new Text(topic.url),
                action: new SnackBarAction(
                  label: '处理',
                  onPressed: (){
                    //TODO
                  },
                ),
              )
          );
        },
        child: Text(topic.name),
      ),
    );
  }

}