import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/account/Account.dart';
import 'package:project_app/chat/chat.dart';
import 'package:project_app/home/Home.dart';
import 'package:project_app/widget/MyItem.dart';
import 'actions/ActionGet.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoad = true;
  var myData;

  Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      ActionGet.getSheetData().then((result) {
        setState(() {
          myData = result.reversed.toList();
        });
      });
    });
    ActionGet.getSheetData().then((result) {
      setState(() {
        myData = result.reversed.toList();
      });
    }).whenComplete(() {
      setState(() {
        isLoad = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTest'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                print('Logout success');
                SystemNavigator.pop();
              })
        ],
      ),
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: isLoad == true
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: myData.length,
                    itemBuilder: (context, index) =>
                        MyItem(data: myData[index]),
                  )),
      ),
    );
  }
}
