import 'package:flutter/material.dart';
import 'package:project_app/Homepage/page_yesterday.dart';
import 'package:project_app/view/CheckList.dart';

class FormScreens extends StatelessWidget {
  final String emailaddress;
  final String roomnumber;
  final String dormitoryX;
  final String list;
  final String photo;

  const FormScreens({
    Key key,
    this.emailaddress,
    this.dormitoryX,
    this.roomnumber,
    this.list,
    this.photo,
  }) : super(key: key);

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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: NetworkImage(photo),
                      ),
                    )
                  ],
                ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'รายการแจ้งซ่อม : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                    overflow: TextOverflow.visible,
                  ),
                  Expanded(
                      child: Text(
                    list,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  )),
                ],
              ),
            ),
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
                      child: Text('ยืนยัน')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
