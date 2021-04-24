import 'package:flutter/material.dart';
import 'package:project_app/Screens/form_screen.dart';

class MyItem extends StatelessWidget {
  final data;
  MyItem({this.data});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'วัน/เวลา(Date/Time):',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  Text(
                      ' ${DateTime.parse(data['informationDate']).toLocal().day}/${DateTime.parse(data['informationDate']).toLocal().month}/${DateTime.parse(data['informationDate']).toLocal().year} เวลา ${DateTime.parse(data['informationDate']).toLocal().hour}:${DateTime.parse(data['informationDate']).toLocal().minute} น.'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ที่อยู่อีเมล(E-mail): ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  Text('${data['emailaddress']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ชื่อผู้แจ้งซ่อม(Repair Person Name) : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  Text('${data['repairname']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'หอพัก(Dormitory) : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  Text(
                    '${data['dormitoryX']}',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'เบอร์โทร(Phone Number) : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  Text('${data['phonenumber']}'),
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
                          return FormScreens();
                        }));
                      },
                      child: Text('บันทึกผล')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
