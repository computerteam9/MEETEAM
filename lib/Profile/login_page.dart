import 'package:flutter/material.dart';
import 'package:meetteam/Api/session.dart';
import 'package:meetteam/Api/user_api.dart';
import 'package:meetteam/Color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _CompleteLogin = false;

  void _CompleteCondition() {
    String email = _emailController.text;
    String password = _passwordController.text;
    bool isId = true;

    UserApi.verifyUser(email, password).then((userId) {
      if (userId == '') isId = false;
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          isId) {
        setState(() {
          _CompleteLogin = true;
        });
      } else {
        setState(() {
          _CompleteLogin = false;
        });
      }
    });
    //로그인에 대한 id 체크 조건 추가
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(50, 150, 50, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Image.asset('assets/images/meeteam_logo.png'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 300,
                        child: TextFormField(
                          controller: _emailController,
                          onChanged: (value) {
                            _CompleteCondition();
                          },
                          decoration: InputDecoration(
                            hintText: '이메일',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 300,
                        child: TextFormField(
                          controller: _passwordController,
                          onChanged: (value) {
                            _CompleteCondition();
                          },
                          decoration: InputDecoration(
                            hintText: '비밀번호',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: ElevatedButton(
                      child: Text(
                        "로그인",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _CompleteLogin) {
                          UserApi.verifyUser(_emailController.text,
                                  _passwordController.text)
                              .then((userId) {
                            Session.set(userId);

                            Navigator.pushNamed(context, '/');
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('잘못된 이메일 또는 비밀번호입니다.')),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text(
                        "아직 회원가입을 하지 않으셨나요?",
                      ))
                ],
              ),
            )));
  }
}
