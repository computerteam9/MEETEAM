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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _CompleteLogin = false;

  void _CompleteCondition() {
    String email = _emailController.text;
    String password = _passwordController.text;

    String userId = UserApi.verifyUser(email, password).toString();

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        userId != '') {
      setState(() {
        _CompleteLogin = true;
      });
    } else {
      setState(() {
        _CompleteLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(children: [
            Column(
              children: <Widget>[
                Row(children: [
                  Text("Id : "),
                  TextFormField(
                    controller: _emailController,
                    onChanged: (value) {
                      _CompleteCondition();
                    },
                  ),
                ]),
                Row(children: [
                  Text("Password : "),
                  TextFormField(
                    controller: _passwordController,
                    onChanged: (value) {
                      _CompleteCondition();
                    },
                    decoration: InputDecoration(),
                  ),
                ]),
              ],
            ),
            ElevatedButton(
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                if (_CompleteLogin) {
                  Session.set(UserApi.verifyUser(
                          _emailController.text, _passwordController.text)
                      .toString());
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ]),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text(
                "회원 가입",
              )
          )
        ]),
      ),
    );
    // TODO: implement build
  }
}
