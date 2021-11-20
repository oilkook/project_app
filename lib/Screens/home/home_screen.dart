import 'package:flutter/material.dart';
import 'package:project_app/Screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
        onPressed: () {
          print('Notifications');
        },
      ),
    );
  }
}
