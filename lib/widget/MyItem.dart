import 'package:flutter/material.dart';
import 'package:project_app/Screens/form_screens.dart';

class MyItem extends StatelessWidget {
  final data;
  MyItem({this.data});
  String getImageUrl(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
    // String postman = '${data['photo']}';
    List<String> afterSplit = url.split("=");
    return googleDriveUrl + afterSplit.last;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => FormScreens(
      //           emailaddress: "${data["emailaddress"]}",
      //           dormitoryX: "${data["dormitoryX"]}",
      //           roomnumber: "${data["roomnumber"]}",
      //         ),
      //       ));
      // },
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(3.0),
      //       child: ElevatedButton(
      //           onPressed: () {
      //             print('object');
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) {
      //               return FormScreens(emailaddress: "${data["emailaddress"]}",
      //           dormitoryX: "${data["dormitoryX"]}",
      //           roomnumber: "${data["roomnumber"]}",);
      //             }));
      //           },
      //           child: Text('บันทึกผล')),
      //     ),
      //   ],
      // ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'วัน/เวลา(Date/Time):',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ),
                    Text(
                      '${DateTime.parse(data['informationDate']).toLocal().day}/${DateTime.parse(data['informationDate']).toLocal().month}/${DateTime.parse(data['informationDate']).toLocal().year} เวลา ${DateTime.parse(data['informationDate']).toLocal().hour}:${DateTime.parse(data['informationDate']).toLocal().minute} น.',
                    ),
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
                      'ห้อง(Room): ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      '${data['roomnumber']}',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'หอพัก(Dormitory): ',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'LINE ID : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data['lineID']}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'วันที่แจ้งซ่อม(DD/MM/YYYY)  : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text(
                        '${DateTime.parse(data['Date']).toLocal().day}/${DateTime.parse(data['Date']).toLocal().month}/${DateTime.parse(data['Date']).toLocal().year}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'ช่วงเวลาในการเข้าซ่อม : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data['status']}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'เวลา (Time) : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data['time']} น.'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'รายการแจ้งซ่อม : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${data['list']}',
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'รูปภาพประกอบ : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image(
                          height: 150,
                          width: 150,
                          image: NetworkImage(getImageUrl('${data['photo']}')),
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
                    Text(
                      'รายละเอียด : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data['details']}'),
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
                            return FormScreens(
                              emailaddress: "${data["emailaddress"]}",
                              dormitoryX: "${data["dormitoryX"]}",
                              roomnumber: "${data["roomnumber"]}",
                              list: "${data["list"]}",
                              photo: getImageUrl("${data["photo"]}"),
                            );
                          }));
                        },
                        child: Text('บันทึกผล')),
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
