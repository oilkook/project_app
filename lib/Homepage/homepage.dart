import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/Homepage/page_yesterday.dart';
import 'package:project_app/Homepage/menu_Item.dart';
import 'package:project_app/account/Account.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/home/Home.dart';
import 'package:project_app/main.dart';
import 'package:project_app/notifications/notifications.dart';
import 'package:project_app/settings/Settings.dart';
import 'package:project_app/widget/MyItem.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoad = true;
  var myData;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";

  Timer _timer;

  final Notifications _notifications = Notifications();
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
      print(result.toString());
      setState(() {
        myData = result.reversed.toList();
      });
    }).whenComplete(() {
      setState(() {
        isLoad = false;
      });
    });
    super.initState();

    this._notifications.initNotifications();
  }

  void _pushNotification() {
    this._notifications.pushNotification();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('RepairMan App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                tooltip: 'Search',
                onPressed: () {
                  print('search');
                },
              ),
            ],
            bottom: TabBar(tabs: [
              Tab(text: 'YesterDay'),
              Tab(
                text: 'ToDay',
              ),
              Tab(
                text: 'Remain',
              )
            ]),
          ),
          drawer: Drawer(
            child: AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSidebarOpened ? 0 : 0,
              right: isSidebarOpened ? 0 : screenWidth - 45,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      color: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    "Oilkook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  subtitle: Text(
                                    "S6135512017@phuket.psu.ac.th",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Home');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.home,
                                    title: "Home",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('account');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Account();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.person,
                                    title: "Account",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Settings');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Settings();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.settings,
                                    title: "Settings",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Logout');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.logout,
                                    title: "Logout",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      width: 0,
                      height: 0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              // Center(
              //   child: PageYesterday(),
              // ),

              // Center(
              //     // child: Text('Page 1'),
              //     child: Image(
              //   image: NetworkImage(
              //       "https://drive.google.com/uc?export=view&id=1lzZBMkC9be3THrr85ZB31YyEXjh3Fk-r"),
              // )
              //     // child: Container(
              //     //   child: HomePage1(),
              //     // ),
              //     ),
              Center(
                  child: isLoad == true
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: myData.length,
                          itemBuilder: (context, index) =>
                              MyItem(data: myData[index]),
                        )),
              Center(
                child: Center(
                    child: isLoad == true
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: myData.length,
                            itemBuilder: (context, index) =>
                                MyItem(data: myData[index]),
                          )),
              ),
              Center(
                child: Text('Page 3'),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _pushNotification,
            tooltip: 'Push notifications',
            child: Icon(Icons.notifications),
          ),
        ),
      ),
    );
  }
}
