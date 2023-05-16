import 'package:flutter/material.dart';
import 'package:meetteam/Appbar/logo_appbar.dart';
import 'package:meetteam/Profile/profile_write_page.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool _isOK = false;
  bool _CompleteSignup = false;

  void _CompleteCondition(){
    if(_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _idController.text.isNotEmpty &&
        _passwordController1.text.isNotEmpty &&
        _passwordController2.text.isNotEmpty &&
        _passwordController1.text == _passwordController2.text &&
        _isOK){
      setState(() {
        _CompleteSignup = true;
      });
    }else{
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
                height: 20.0,
              ),
              TextFormField(
                controller: _nameController,
                onChanged: (text) {_CompleteCondition();},
                decoration: InputDecoration(hintText: '이름'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _emailController,
                onChanged: (text) {_CompleteCondition();},
                decoration: InputDecoration(hintText: '이메일'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _idController,
                onChanged: (text) {_CompleteCondition();},
                decoration: InputDecoration(hintText: '아이디'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true, // 비밀번호를 적을때 안보이도록
                controller: _passwordController1,
                onChanged: (text) {_CompleteCondition();},
                decoration: InputDecoration(hintText: '비밀번호'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController2, // 비밀번호를 적을때 안보이도록
                onChanged: (text) {_CompleteCondition();},
                decoration: InputDecoration(hintText: '비밀번호 확인'),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: _isOK,
                      onChanged: (value) {
                        setState(() {
                          _isOK = value!;
                          _CompleteCondition();
                        });
                      }),
                  Text('개인정보 동의'),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                child: Text("가입하기"),
                //5개의 값이 입력되어야 하고 비밀번호와 비밀번호 확인의 값이 같아야하고
                // 개인정보동의가 되어야 가입하기 버튼을 누를 수 있음

                onPressed: _CompleteSignup ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfileWritePage(changed: true,))) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
