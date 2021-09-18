import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  CheckList({Key key}) : super(key: key);

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool isButtonPress = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ส่งอีเมลตอบกลับ'),
        ),
        backgroundColor: Colors.white,
        body: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "[ประชาสัมพันธ์]แจ้งซ่อม",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Text(
                            "จากฟอร์มการแจ้งซ่อมตามวันเวลาที่กำหนด ขณะนี้ได้ทำการซ่อมเสร็จแล้ว",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Name',
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: telephone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Phone',
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'E-Mail',
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Send To Email'),
                  onPressed: () {
                    setState(() {
                      isButtonPress = !isButtonPress;
                    });
                  },
                ),
              ),
              isButtonPress == false
                  ? Text('')
                  : Expanded(
                      child: Column(
                        children: [
                          Text(' '),
                          Text(
                            'Your Name  is ${nameController.text.trim()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            ' Phone  is ${telephone.text.trim()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            ' E-mail is ${emailController.text.trim()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
