import 'package:flutter/material.dart';

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
            // Text('$data')
            Row(
              children: [
                Text(
                  'วัน/เวลา(Date/Time):',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                Text(
                    '${DateTime.parse(data['informationDate']).toLocal().day}/${DateTime.parse(data['informationDate']).toLocal().month}/${DateTime.parse(data['informationDate']).toLocal().year}เวลา${DateTime.parse(data['informationDate']).toLocal().hour}:${DateTime.parse(data['informationDate']).toLocal().minute}น.'),
              ],
            ),
            Row(
              children: [
                Text(
                  'ที่อยู่อีเมล(E-mail): ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                Text('${data['emailaddress']}'),
              ],
            ),
            Row(
              children: [
                Text(
                  'ชื่อผู้แจ้งซ่อม(Repair Person Name) : ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                Text('${data['repairname']}'),
              ],
            ),
            Row(
              children: [
                Text(
                  'หอพัก(Dormitory) : ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                Text(
                  '${data['dormitoryX']}',
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'เบอร์โทร(Phone Number) : ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                Text('${data['phonenumber']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
