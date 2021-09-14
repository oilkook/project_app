import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_app/view/CheckList.dart';

class FormScreens extends StatelessWidget {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกผลการเข้าซ่อม'),
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ซ่อมเสร็จแล้ว ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print('Check');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckList()));
                        },
                        child: Text('Check')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
