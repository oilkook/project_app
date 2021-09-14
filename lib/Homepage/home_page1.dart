import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Homepage/menu_Item.dart';
import 'package:project_app/Screens/form_screen.dart';
import 'package:project_app/account/Account.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/home/Home.dart';
import 'package:project_app/settings/Settings.dart';
import 'package:project_app/widget/MyItem.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  bool isLoad = true;
  var myData1;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  Timer _timer1;
  @override
  void initState() {
    _timer1 = Timer.periodic(Duration(minutes: 10), (timer1) {
      ActionGet.getSheetData().then((result) {
        setState(() {
          myData1 = result.reversed.toList();
        });
      });
    });
    ActionGet.getSheetData().then((result) {
      setState(() {
        myData1 = result.reversed.toList();
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
    super.dispose();
    _timer1.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
          child: isLoad == true
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: myData1.length,
                  itemBuilder: (context, index) => MyItem(data: myData1[index]),
                )),
    );
  }
}
