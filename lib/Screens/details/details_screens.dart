import 'package:flutter/material.dart';
import 'package:project_app/Screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยืนยันรายการแจ้งซ่อม'),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Body(),
    );
  }
}
