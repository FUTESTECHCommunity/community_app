//登陆信息
class AuthState {
  bool isLogin;
  bool isLocalLogin;
  String token;
  AuthState({this.isLogin:false, this.isLocalLogin:false, this.token : ''});
}

class AppState {
  AuthState auth;
  Account account;

  AppState({this.auth, this.account});
}

//用户账号信息
class Account {
  int id;
  String avatar;
  String name;
  String email;
  String phone;
//  String password;
  String x25519PubKey;
  String x25519SecretKey;
  String pubKey;
  String secretKey;
  String cyptoContent;
  String authenticator;

  Account({this.id, this.avatar, this.name, this.email, this.phone, this.x25519PubKey, this.x25519SecretKey, this.pubKey, this.secretKey, this.cyptoContent, this.authenticator});
}