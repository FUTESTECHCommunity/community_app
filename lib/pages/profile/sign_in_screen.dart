import 'package:flutter/material.dart';
import '../profile/sign_up_screen.dart';
import '../../widgets/prompt/prompt_wait.dart';
import '../home_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }

}

class _SignInScreenState extends State<SignInScreen> {
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool _validPhone = true;
  bool _validPassword = true;

  @override
  void dispose() {
    print("dispose!");
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
//    _scaffoldKey.currentState.dispose();
  }

  //跳转到注册界面
  void _openSignUp() {
    setState(() {
      Navigator.of(context).push(new MaterialPageRoute<List<String>>(builder: (BuildContext context){
        return new SignUpScreen();
      })).then((onValue){
        if(onValue != null) {
          _phoneController.text = onValue[0];
          _passwordController.text = onValue[1];
          FocusScope.of(context).requestFocus(new FocusNode());
//          _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('注册成功!')));
        }
      });
    });
  }

  //验证输入
  void _checkInput() {
    print("checkInput!");
    if(_phoneController.text.isNotEmpty && _phoneController.text.trim().length != 11) {
      _validPhone = false;
    }else {
      _validPhone = true;
    }

    if(_passwordController.text.isNotEmpty &&
        (_passwordController.text.trim().length < 6
        || _passwordController.text.trim().length > 20)
    ) {
      _validPassword = false;
    }else {
      _validPassword = true;
    }
    if(this.mounted) {
      setState(() {
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      key: _scaffoldKey,
      body: new SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        child: new Stack(children: <Widget>[
          new GestureDetector(
            onTap: () {
              print("ok!");
              FocusScope.of(context).requestFocus(new FocusNode());
              _checkInput();
            },
            child: new Container(
              decoration: new BoxDecoration(),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              new Center(
//                child: new Image.asset('assets/images/festech_community_logo.png',
//                    width: MediaQuery.of(context).size.width * 0.4
//                ),
//              ),
              new Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: new InputDecoration(
                          hintText: '手机号',
                          errorText: _validPhone ? null : '手机号码11位',
                          icon: new Icon(Icons.phone, color: Theme.of(context).iconTheme.color,)
                      ),
                      onSubmitted: (value) {
                        _checkInput();
                      },
                    ),
                    new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          hintText: '登陆密码',
                          errorText: _validPassword ? null : '密码的长度在6到20位之间',
                          icon: new Icon(Icons.lock_outline, color: Theme.of(context).iconTheme.color,)
                      ),
                      onSubmitted: (value) {
                        _checkInput();
                      },
                    )
                  ],
                ),
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
                      child: new Text('登陆', textScaleFactor: 1.1, style: new TextStyle(color: Theme.of(context).primaryColor),),
                    ),
                  )
              ),
              new Center(
                child: new FlatButton(
                    onPressed: _openSignUp,
                    child: new Text("没有账户? 注册", style: new TextStyle(color: Theme.of(context).accentColor),)
                ),
              )
            ],
          ),
        ],),
      )
    );
  }

  void _handleSubmitted() {
    print("handleSubmitted!");
    FocusScope.of(context).requestFocus(new FocusNode());
    _checkInput();
    if(_phoneController.text == '' || _passwordController.text == '') {
      showMessage(context, "登陆信息填写不完整!");
      return;
    }else if(!_validPassword || !_validPhone) {
      showMessage(context, "登陆信息格式不正确!");
      return;
    }

//    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
//      return new Home();
//    }));
    showDialog<int>(
      context: context,
      barrierDismissible: false,
      child: new ShowProgress(_userLogin(_phoneController.text.trim(), _passwordController.text.trim()).then((int onValue){
        print("problem?");
        if(onValue == 0) {//TODO 处理返回消息
          showMessage(context, "手机号码或登陆密码不正确!");
        }else {
          print("登陆成功！");
//            showMessage(context, "登陆成功!");
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
            return new Home();
          }));
        }
      })),
//      builder: (BuildContext context) {
//        print("what's the problem?");
//        return new ShowProgress(_userLogin(_phoneController.text.trim(), _passwordController.text.trim()).then((int onValue){
//          print("problem?");
//          if(onValue == 0) {//TODO 处理返回消息
//            showMessage(context, "手机号码或登陆密码不正确!");
//          }else {
//            print("登陆成功！");
////            showMessage(context, "登陆成功!");
//            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
//              return new Home();
//            }));
//          }
//        }));
//      }
    );
  }

  Future<int> _userLogin(String phone, String password) async{
    //TODO 登陆
    await Future.delayed(Duration(seconds: 5));
    return 1;
  }

}