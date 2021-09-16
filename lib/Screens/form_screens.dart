import 'package:flutter/material.dart';
import 'package:project_app/Homepage/page_yesterday.dart';
import 'package:project_app/view/CheckList.dart';

class FormScreens extends StatelessWidget {
  final String emailaddress;
  final String roomnumber;
  final String dormitoryX;

  const FormScreens(
      {Key key, this.emailaddress, this.dormitoryX, this.roomnumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกผลการแจ้งซ่อม'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('ที่อยู่อีเมล(E-mail):',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(emailaddress),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('ห้อง(Room):',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(roomnumber),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('หอพัก(Dormitory) :',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(dormitoryX),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print('object');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CheckList();
                        }));
                      },
                      child: Text('ส่งEmail')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
