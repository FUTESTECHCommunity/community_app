//import 'dart:typed_data';
//
import 'package:flutter/material.dart';
import './pages/home_widget.dart';
import './redux/models/app_state.dart';
//import 'package:path_provider/path_provider.dart';
//import 'dart:io';
//import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './redux/reducers/app_state_reducer.dart';
//import 'package:hex/hex.dart';
//import 'package:bip39/bip39.dart' as bip39;
//import 'package:flutter_sodium/flutter_sodium.dart';

void main() {
//  _generateCryptoFile().then((_){
//    runApp(new FuturerApp());
//  });
  final store = new Store<AppState>(appReducer, initialState: new AppState());
  runApp(new FuturerApp(store: store,));
}

final ThemeData appThemeData = new ThemeData(
  highlightColor: Colors.transparent, //将点击高亮设为透明
  splashColor: Colors.transparent,//将闪屏颜色设为透明
  bottomAppBarColor: new Color.fromRGBO(244, 245, 245, 1.0),//设置底部导航的背景色
  scaffoldBackgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),//设置页面背景颜色
  primaryIconTheme: new IconThemeData(color: Colors.black),//主要icon样式，如头部返回icon按钮
  indicatorColor: Colors.blue, //设置tab指示器颜色
  iconTheme: new IconThemeData(size:18.0), //设置icon样式
  primaryTextTheme: new TextTheme(
    title: new TextStyle(color: Colors.black, fontSize: 16.0)
  ),//设置文本颜色
);

//final String serverPublicKey = "0447ecca013dd8a118912fdb4efebf9732e79618932ad0d0d2b91dd1885601499329bca95cc7a951184e5092f5ff43ac05fb90fde24f23350e6c0ded3f5a56290d";
//
//Future<Null> _generateCryptoFile() async {
//  String dir = (await getApplicationDocumentsDirectory()).path;
//  File userJson = new File("$dir/user.json");
////  //TODO
////  if(!await userJson.exists()) {
////    userJson = await userJson.create(recursive: true);
////    String randomMnemonic = bip39.generateMnemonic();
////    userJson = await userJson.writeAsString(randomMnemonic);
////
////    KeyPair keyPair = await KeyExchange.generateKeyPair();
////    HexEncoder hexEncoder = new HexEncoder();
////    HexDecoder hexDecoder = new HexDecoder();
////    String pubKey = hexEncoder.convert(keyPair.publicKey);
////    String secretKey = hexEncoder.convert(keyPair.secretKey);
////    Uint8List session = await ScalarMult.computeSharedSecret(keyPair.secretKey, hexDecoder.convert(serverPublicKey));
////    print("pubKey:" + pubKey);
////    print("secretKey:" + secretKey);
////    print("sessionKey:" + hexEncoder.convert(session));
////  }
//}

class FuturerApp extends StatelessWidget {
  final Store<AppState> store;

  FuturerApp({this.store});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: '未来家',
        theme: appThemeData,
        home: new Home(),
      )
    );
//
//    return new MaterialApp(
//      title: '未来家',
//      theme: appThemeData,
//      home: new Home(),
//    );
  }
}