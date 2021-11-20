import 'package:flutter/material.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';

class More extends StatefulWidget {
  const More({Key key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool isLoad = true;
  List<Bill> myData = [];
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];
  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";

  final Notifications _notifications = Notifications();
  initialAction() async {
    final List<Bill> res = await ActionGet.getSheetData();
    print("res => ${res.runtimeType}");

    res.sort(
        (Bill a, Bill b) => b.informationDate.compareTo(a.informationDate));
    print(res.toString());
    final List<Bill> msg_0 =
        res.where((element) => element.msg == "0").toList();
    final List<Bill> msg_1 =
        res.where((element) => element.msg == "1").toList();

    setState(() {
      requestedStatus = msg_0;
      repairConfirm = msg_1;
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('More Request')),
        body: ListView.builder(itemBuilder: (context, index) {
          return Container();
        }));
  }
}
