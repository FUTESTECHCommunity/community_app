import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:futurer/widgets/radial_menu/radial_menu.dart';
//import 'package:futurer/widgets/radial_menu/radial_menu_item.dart';
import '../profile/sign_in_screen.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_sodium/flutter_sodium.dart';
import 'package:hex/hex.dart';
import 'dart:io';
//import 'dart:async';
import '../profile/lottie_demo_screen.dart';

//CustomScrollView
//SliverAppBar SliverList
//Flutter从入门到奔溃（二）：撸一个个人界面
//https://blog.csdn.net/weixin_28717693/article/details/81811730

//任务TODO列表FlutterTodo
//参考：https://github.com/littlemarc2011/FlutterTodo

//电影界面，参考movie-details-ui
//https://github.com/roughike/movie-details-ui

//page-transformer
//https://github.com/roughike/page-transformer

//FlutterCardSwipe
//https://github.com/geekruchika/FlutterCardSwipe

//FlutterCardSwipe
//https://github.com/geekruchika/FlutterCardSwipe

//山寨掘金
//https://github.com/MeFelixWang/juejin/blob/master/README.md
class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }

}

//
//enum MenuOptions {
//  unread,
//  share,
//  archive,
//  delete,
//  backup,
//  copy,
//}

class _ProfileScreenState extends State<ProfileScreen> {
//  String _seed = '';
  final TextEditingController _seedController = new TextEditingController();
  final TextEditingController _clientPKeyController = new TextEditingController();
  final TextEditingController _clientSKeyController = new TextEditingController();
  final TextEditingController _serverPKeyController = new TextEditingController();
  final TextEditingController _serverSKeyController = new TextEditingController();
  final TextEditingController _sessionKeyController = new TextEditingController();

  @override
  void initState() {
    super.initState();
//    _serverPKeyController.text = 'f43ae3b47138a406ac72ce599cb5f25e1714922a966861d97775843956dfcd26';
//    _serverSKeyController.text = '180b6a7274b2797688d7d7d6e982ad13c49923ba6d52f8ecd93a9a1b2ba60a76';
//    _getSeed();
  }

//  void _getSeed() async {
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    File userJson = new File("$dir/user.json");
//    if(await userJson.exists()) {
//      _seed = await userJson.readAsString();
//     if(this.mounted) {
//       setState(() {});//刷新
//     }
//    }
//    return;
//  }

//  void _generateClientKey() async {
////    KeyPair keyPair = await CryptoBox.generateKeyPair();
////    Uint8List secretKey = keyPair.secretKey;
////    Uint8List publicKey = keyPair.publicKey;
////    Uint8List secretKey = await ScalarMult.generateSecretKey();
//    HexDecoder hexDecoder = new HexDecoder();
//    Uint8List secretKey = hexDecoder.convert("028d178666a1625b873d2372d28a438dc6478d8387a20fa9bd43d39c259917be");
//    Uint8List publicKey = await ScalarMult.computePublicKey(secretKey);
//    HexEncoder hexEncoder = new HexEncoder();
//    print('client secret key:' + hexEncoder.convert(secretKey));
////    Uint8List publicKey = await ScalarMult.computePublicKey(secretKey);
//    print('client public key:' + hexEncoder.convert(publicKey));
//    _clientSKeyController.text = hexEncoder.convert(secretKey);
//    _clientPKeyController.text = hexEncoder.convert(publicKey);
//    setState(() {
//
//    });
//  }

//  void _generateSessionKey() async {
//    String serverPKeyStr = _serverPKeyController.text;
//    String clientSKeyStr = _clientSKeyController.text;
//    HexDecoder hexDecoder = new HexDecoder();
//    Uint8List serverPKey = hexDecoder.convert(serverPKeyStr);
//    Uint8List clientSKey = hexDecoder.convert(clientSKeyStr);
//    Uint8List sessionKey = await ScalarMult.computeSharedSecret(clientSKey, serverPKey);
//    HexEncoder hexEncoder = new HexEncoder();
//    _sessionKeyController.text = hexEncoder.convert(sessionKey);
//    print("session key:" + hexEncoder.convert(sessionKey));
//    setState(() {
//
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            new Text(_seed == '' ? 'Unknown' : _seed, style: TextStyle(color: Theme.of(context).primaryColor),),
            new RaisedButton(
              child: Text('登陆'),
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute<List<String>>(builder: (BuildContext context){
                  return new SignInScreen();
                }));
              }
            ),
//            new RaisedButton(
//                child: Text('Lottie'),
//                onPressed: (){
//                  Navigator.of(context).push(new MaterialPageRoute<List<String>>(builder: (BuildContext context){
//                    return new LottieDemo();
//                  }));
//                }
//            ),
//            new TextField(
//              controller: _seedController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                  hintText: 'seed',
//              ),
//            ),
//            new TextField(
//              controller: _clientPKeyController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                hintText: 'client public key'
//              ),
//            ),
//            new TextField(
//              controller: _clientSKeyController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                hintText: 'client secret key'
//              ),
//            ),
//            new TextField(
//              controller: _serverPKeyController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                hintText: 'server public key'
//              ),
//            ),
//            new TextField(
//              controller: _serverSKeyController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                hintText: 'server secret key'
//              ),
//            ),
//            new TextField(
//              controller: _sessionKeyController,
//              keyboardType: TextInputType.multiline,
//              decoration: new InputDecoration(
//                  hintText: 'session key'
//              ),
//            ),
//            new RaisedButton(
//                child: Text('生成client key'),
//                onPressed: (){
//                  _generateClientKey();
//                }
//            ),
//            new RaisedButton(
//              child: Text('生成session key'),
//              onPressed:(){
//                _generateSessionKey();
//              }
//            )
          ],
        ),
      ),
    );
  }

//  GlobalKey<RadialMenuState> _menuKey = new GlobalKey<RadialMenuState>();
//
//  final List<RadialMenuItem<MenuOptions>> items = <RadialMenuItem<MenuOptions>>[
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.unread,
//      child: new Icon(
//        Icons.markunread,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.blue[400],
//      tooltip: 'unread',
//    ),
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.share,
//      child: new Icon(
//        Icons.share,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.green[400],
//    ),
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.archive,
//      child: new Icon(
//        Icons.archive,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.yellow[400],
//    ),
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.delete,
//      child: new Icon(
//        Icons.delete,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.red[400],
//    ),
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.backup,
//      child: new Icon(
//        Icons.backup,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.black,
//    ),
//    new RadialMenuItem<MenuOptions>(
//      value: MenuOptions.copy,
//      child: new Icon(
//        Icons.content_copy,
//      ),
//      iconColor: Colors.white,
//      backgroundColor: Colors.indigo[400],
//    ),
//  ];
//
//  void _onItemSelected<MenuOptions>(MenuOptions value) {
//    print(value);
//    _menuKey.currentState.reset();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      margin: EdgeInsets.all(20.0),
//      child: new Column(
//        children: <Widget>[
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Expanded(
//                  flex: 2,
//                  child: new TextField()
//              ),
//              new Expanded(
//                  flex: 1,
//                  child: new Container(
//                    height: 80.0,
//                    child: new RadialMenu(
//                      key: _menuKey,
//                      items: items,
//                      radius: 100.0,
//                      onSelected: _onItemSelected,
//                    ),
//                  )
//              )
//            ],
//          ),
//          new TextField(
//            textAlign: TextAlign.left,
//            decoration: InputDecoration(
//              hintText: '请输入',
//              labelText: '籍贯',
//            ),
//          ),
//          new Container(
//            margin: EdgeInsets.all(5.0),
//          ),
//          new RaisedButton(
//            child: Text('登陆'),
//            onPressed: (){
//              Navigator.of(context).push(new MaterialPageRoute<List<String>>(builder: (BuildContext context){
//                return new SignInScreen();
//              }));
//            }
//          ),
//          new Container(
//            margin: EdgeInsets.all(20.0),
//            height: 40.0,
//            child: new Center(
//              child: new RadialMenu(items: items, onSelected: _onItemSelected, /*key: _menuKey, */radius: 100.0,),
//            ),
//          )
//        ],
//      ),
//    );
//
//  }

}