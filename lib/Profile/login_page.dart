import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  children: [
                    Text(
                        "Id : "
                    ),
                    TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(
                      ),
                    ),
                  ]),
              Row(
                  children: [
                    Text(
                        "Password : "
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                      ),
                    ),
                  ]),
            ],
          )
      ),
    );
    // TODO: implement build
  }

}