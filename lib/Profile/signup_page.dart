import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/logo_appbar.dart';
import 'package:meetteam/Profile/profile_write_page.dart';
import '../Api/user_api.dart';
import 'package:meetteam/Api/session.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool _CompleteSignup = false;

  bool _checkId = true;
  bool _checkPassword = true;
  bool _checkPassword2 = true;
  bool _checkEmail = true;

  @override
  void dispose() {
    _emailController.dispose();
    _idController.dispose();
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  void _checkEmailCondition() {
    String id = _emailController.text;
    bool isValid = id.contains(RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$'));
    setState(() {
      _checkEmail = isValid;
    });
  }

  void _checkIdCondition() {
    //아이디 조건
    String id = _idController.text;
    bool isValid = id.length >= 5 && id.length < 15;
    setState(() {
      _checkId = isValid;
    });
  }

  void _checkPasswordcondition() {
    //비밀번호 조건
    String id = _passwordController1.text;
    bool isValid = id.length >= 8 &&
        id.length <= 20 &&
        id.contains(RegExp(r'[a-zA-Z]')) &&
        id.contains(RegExp(r'[0-9]'));
    setState(() {
      _checkPassword = isValid;
    });
  }

  void _checkPassword2condition() {
    //비밀번호 일치 조건
    bool isValid = (_passwordController1.text == _passwordController2.text);
    setState(() {
      _checkPassword2 = isValid;
    });
  }

  void _CompleteCondition() {
    if (_emailController.text.isNotEmpty &&
        _emailController.text.contains(RegExp(
            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')) &&
        _idController.text.isNotEmpty &&
        _idController.text.length >= 5 &&
        _idController.text.length <= 15 &&
        _passwordController1.text.length >= 8 &&
        _passwordController1.text.length <= 20 &&
        _passwordController1.text.isNotEmpty &&
        _passwordController2.text.isNotEmpty &&
        _passwordController1.text.contains(RegExp(r'[a-zA-Z]')) &&
        _passwordController1.text.contains(RegExp(r'[0-9]')) &&
        _passwordController1.text == _passwordController2.text &&
        _checkId) {
      setState(() {
        _CompleteSignup = true;
      });
    } else {
      setState(() {
        _CompleteSignup = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(key: UniqueKey(), appBar: AppBar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              const Text('회원가입',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                controller: _emailController,
                onChanged: (value) {
                  _CompleteCondition();
                  _checkEmailCondition();
                },
                decoration: InputDecoration(
                    hintText: '이메일',
                    errorText: _checkEmail ? null : '이메일의 형식이 아닙니다.'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _idController,
                onChanged: (value) {
                  _CompleteCondition();
                  _checkIdCondition();
                },
                decoration: InputDecoration(
                  hintText: '아이디',
                  errorText: _checkId ? null : '아이디는 5자 이상 15자 이하이어야 합니다.',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true, // 비밀번호를 적을때 안보이도록
                controller: _passwordController1,
                onChanged: (value) {
                  _CompleteCondition();
                  _checkPasswordcondition();
                },
                decoration: InputDecoration(
                    hintText: '비밀번호',
                    errorText: _checkPassword
                        ? null
                        : '비밀번호는 8자 이상 20자 이하이어야 하고 영어와 숫자를 포함해야 합니다.'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController2, // 비밀번호를 적을때 안보이도록
                onChanged: (value) {
                  _CompleteCondition();
                  _checkPassword2condition();
                },
                decoration: InputDecoration(
                    hintText: '비밀번호 확인',
                    errorText: _checkPassword2 ? null : '비밀번호가 일치하지 않습니다.'),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                child: Text("가입하기"),
                //5개의 값이 입력되어야 하고 비밀번호와 비밀번호 확인의 값이 같아야하고
                // 개인정보동의가 되어야 가입하기 버튼을 누를 수 있음

                onPressed: () async {
                  if(_CompleteSignup) {
                    UserApi.addUser(
                        _emailController.text,
                        //email
                        _passwordController1.text,
                        //password
                        _idController.text,
                        //nickname
                        '',
                        //introduction
                        '',
                        //blog
                        [
                          {} // ex) python: 3 >> 파이썬 3년
                        ],
                        //spec
                        [
                        ] //interest 관심사
                    );
                    Session.set(_idController);

                    Navigator.pushNamed(context, '/profileWrite',
                        arguments: ProfileWritePageArguments(true));

                }
                  else {
                    null;
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
