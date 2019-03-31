import 'package:flutter/material.dart';
import '../../widgets/prompt/prompt_wait.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }

}

class _SignUpScreenState extends State<SignUpScreen> {
//  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  bool _validPhone = true;
  bool _validUserName = true;
  bool _validPassword = true;
  bool _validEmail = true;

  void _checkInput() {//TODO 正则表达式验证
    if(_phoneController.text.isNotEmpty && _phoneController.text.trim().length != 11){
      _validPhone = false;
    }else{
      _validPhone = true;
    }
    if(_usernameController.text.isNotEmpty && (_usernameController.text.trim().length < 2 || _usernameController.text.trim().length > 20)){
      _validUserName = false;
    }else{
      _validUserName = true;
    }
    if(_emailController.text.isNotEmpty && _emailController.text.trim().length < 6) {
      _validEmail = false;
    }else {
      _validEmail = true;
    }
    if(_passwordController.text.isNotEmpty && _passwordController.text.trim().length < 6){
      _validPassword = false;
    }else {
      _validPassword = true;
    }
  }

  void _handleSubmitted() {
    FocusScope.of(context).requestFocus(new FocusNode());
    _checkInput();
    if(_usernameController.text == '' || _passwordController.text == '' || _phoneController.text == '' || _emailController.text == '') {
      showMessage(context, "注册信息填写不完整!");
      return;
    }else if(!_validPhone || !_validUserName || !_validPassword || _validEmail) {
      showMessage(context, "注册信息格式不正确!");
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return new ShowProgress(_userSignUp(_usernameController.text.trim(), _passwordController.text.trim(), _emailController.text.trim(), _phoneController.text.trim()).then((int onValue) {
          if(onValue == 0) {
            showMessage(context, "这个号码已经被注册!");//TODO 返回详细的错误消息
          }else {
            Navigator.of(context).pop([_phoneController.text, _passwordController.text]);
          }
        }));
      }
    );
  }

  Future<int> _userSignUp(String username, String password, String email, String phone) async {
    //TODO seed，账号，X25519等等
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      key: _scaffoldKey,
      body: new SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
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
                new Container(
                  height: 30,
                ),
                new BackButton(),
                new Center(
                  child: new Text(" 注册账户", textScaleFactor: 2.0,),
                ),
                _buildSignUp(),
                new FlatButton(
                    onPressed: (){
                      _handleSubmitted();
                    },
                    child: new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30.0,
                      decoration: new BoxDecoration(color: Theme.of(context).buttonColor),
                      child: new Center(
                        child: new Text('提交', textScaleFactor: 1.1, style: new TextStyle(color:Theme.of(context).primaryColor),),
                      ),
                    )
                ),
                new Center(
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("已经有账户了? 登陆", style: new TextStyle(color: Theme.of(context).accentColor),),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget _buildSignUp() {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.96,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                helperText: '账号的唯一标识',
                hintText: '手机号码',
                errorText: _validPhone ? null : '手机号的长度应该为11位',
                icon: new Icon(
                Icons.phone,
                color: Theme.of(context).iconTheme.color,
                )
              ),
              onSubmitted: (value) {
                _checkInput();
              },
            ),
            new TextField(
              controller: _usernameController,
              decoration: new InputDecoration(
                helperText: '你这么优秀,其他人知道吗?',
                hintText: '用户名称',
                errorText: _validUserName ? null : '名称的长度应该在2到12位之间',
                icon: new Icon(Icons.account_circle, color: Theme.of(context).iconTheme.color,)
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
                helperText: '账户的登陆密码',
                hintText: '登陆密码',
                errorText: _validPassword ? null : '密码的长度在6到20位之间',
                icon: new Icon(Icons.lock_outline, color: Theme.of(context).iconTheme.color,)
              ),
              onSubmitted: (value) {
                _checkInput();
              },
            ),
            new TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                helperText: '方便我们联系你',
                hintText: '电子邮箱',
                errorText: _validEmail ? null : '邮箱必填',
                icon: new Icon(Icons.email, color: Theme.of(context).iconTheme.color,)
              ),
              onSubmitted: (value) {
                _checkInput();
              },
            )
          ],
        )
    );
  }

}