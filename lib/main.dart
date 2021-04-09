import 'dart:async';
import 'package:flutter/material.dart';
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
          myData = result;
        });
      });
    });
    ActionGet.getSheetData().then((result) {
      setState(() {
        myData = result;
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
      ),
      body: Center(
          child: isLoad == true
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) => MyItem(data: myData[index]),
                )),
    );
  }
}
