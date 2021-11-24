import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Screens/home/home_screen.dart';
import 'package:project_app/actions/ActionLogin.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/login/login_screens.dart';

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
      backgroundColor: Colors.orange[100],
      body: Column(
        children: <Widget>[
          Spacer(flex: 1),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.height / 3,
              child: Image.asset('assets/images/Iogo1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Form(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    ),
                  ),
                  // TextFormField(
                  //   controller: _emailController,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(width: 1))),
                  // ),
                  // SizedBox(height: 20),
                  // TextFormField(
                  //   obscureText: true,
                  //   controller: _passwordController,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(width: 1))),
                  // ),
                ],
              ),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //   child: Row(
          //     children: <Widget>[
          //       Expanded(
          //         child: FlatButton(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(36),
          //           ),
          //           color: Colors.orange,
          //           onPressed: () {},
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(vertical: 16),
          //             alignment: Alignment.center,
          //             width: double.infinity,
          //             child: Text(
          //               'Sign In With Google',
          //               style: TextStyle(
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Expanded(
          //         child: FlatButton(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(36),
          //               side: BorderSide(color: Colors.orange)),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return LoginScreen();
          //                 },
          //               ),
          //             );
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(vertical: 16),
          //             alignment: Alignment.center,
          //             width: double.infinity,
          //             child: Text(
          //               'Login',
          //               style: TextStyle(
          //                 color: Colors.orange,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
          // Container(
          //   alignment: Alignment.center,
          //   width: MediaQuery.of(context).size.width * 0.5,
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   color: Colors.orange,
          //   child: ElevatedButton(
          //     child: Text('Sign In',
          //         style: TextStyle(
          //             color: Colors.red[700],
          //             fontSize: 16,
          //             fontWeight: FontWeight.bold)),
          //     onPressed: () {},
          //   ),
          // ),
          // SizedBox(height: 20),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.5,
          //   child: ElevatedButton(
          //     child: Text('Sign in With Google'),
          //     onPressed: () {},
          //   ),
          // ),
          // Spacer(flex: 1),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return HomeScreen();
                      },
                    );
                  },
                  child: Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: kPrimaryColor,
                      child: Text("Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    // showCupertinoDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return Container(
                    //       child: Card(
                    //         child: Text('sss'),
                    //       ),
                    //     );
                    //   },
                    // );
                    await ActionLogin().loginWithGoogle();
                  },
                  child: Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.red,
                      child: Text("Log In With Google",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
