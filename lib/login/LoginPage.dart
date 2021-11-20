import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Spacer(flex: 1),
      Padding(
        padding: const EdgeInsets.all(60),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ElevatedButton(
          child: Text('Sign In'),
          onPressed: () {},
        ),
      ),
      SizedBox(height: 20),
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ElevatedButton(
          child: Text('Sign in With Google'),
          onPressed: () {},
        ),
      ),
      Spacer(flex: 1),
    ]));
  }
}
