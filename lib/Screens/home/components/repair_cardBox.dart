import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/details_screens.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';

class RepairCardBox extends StatefulWidget {
  const RepairCardBox({
    Key key,
  }) : super(key: key);

  @override
  _RepairCardBoxState createState() => _RepairCardBoxState();
}

class _RepairCardBoxState extends State<RepairCardBox> {
  bool isLoad = true;
  List<Bill> myData = [];
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];
  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
  Timer _timer;
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
    initialAction();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      initialAction();
    });

    super.initState();

    this._notifications.initNotifications();
  }

  void _pushNotification() {
    this._notifications.pushNotification();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isLoad == true
        ? SpinKitPouringHourGlassRefined(color: Colors.blue)
        : requestedStatus.length > 0
            ? Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: requestedStatus.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.height / 4,
                      child: RepairCard(
                        data: requestedStatus[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            : Center(child: Text("No Requested Now"));

    // SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: <Widget>[

    //       // RepairCard(
    //       //   title: 'Papavarin',
    //       //   domitory: '3',
    //       //   room: '213',
    //       //   press: () {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailsScreen(),
    //   ),
    // );
    //       //   },
    //       // ),
    //       // RepairCard(
    //       //   title: 'Papavarin',
    //       //   domitory: '3',
    //       //   room: '213',
    //       //   press: () {
    //       //     Navigator.push(
    //       //       context,
    //       //       MaterialPageRoute(
    //       //         builder: (context) => DetailsScreen(),
    //       //       ),
    //       //     );
    //       //   },
    //       // ),
    //       // RepairCard(
    //       //   title: 'Papavarin',
    //       //   domitory: '3',
    //       //   room: '213',
    //       //   press: () {
    //       //     Navigator.push(
    //       //       context,
    //       //       MaterialPageRoute(
    //       //         builder: (context) => DetailsScreen(),
    //       //       ),
    //       //     );
    //       //   },
    //       // ),
    //       // RepairCard(
    //       //   title: 'Papavarin',
    //       //   domitory: '3',
    //       //   room: '213',
    //       //   press: () {
    //       //     Navigator.push(
    //       //       context,
    //       //       MaterialPageRoute(
    //       //         builder: (context) => DetailsScreen(),
    //       //       ),
    //       //     );
    //       //   },
    //       // ),
    //     ],
    //   ),
    // );
  }
}

class RepairCard extends StatelessWidget {
  const RepairCard({
    Key key,
    this.image,
    this.title,
    this.domitory,
    this.room,
    this.press,
    this.data,
  }) : super(key: key);
  final String image, title, domitory, room;
  final Function press;
  final Bill data;
  String getImageUrl(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
    List<String> afterSplit = url.split("=");
    return googleDriveUrl + afterSplit.last;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(children: [
              Expanded(
                child: Container(
                    child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  imageUrl: getImageUrl('${data.photo}'),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${DateTime.parse(data.informationDate).toLocal().day}/${DateTime.parse(data.informationDate).toLocal().month}/${DateTime.parse(data.informationDate).toLocal().year}',
                      style: Theme.of(context).textTheme.button,
                    ),
                    Text(
                        'เวลา ${DateTime.parse(data.informationDate).toLocal().hour}:${DateTime.parse(data.informationDate).toLocal().minute} น.'),
                    Text('ชื่อ ${data.repairname.toUpperCase()}'),
                    Text('${data.dormitoryX} ห้อง ${data.roomnumber}'),

                    // TextSpan(
                    //   text: "${data.repairname}\n".toUpperCase(),
                    //   style: Theme.of(context).textTheme.button,
                    // ),
                    // TextSpan(
                    //   text: " ${data.dormitoryX}".toUpperCase(),
                    //   style: TextStyle(
                    //     color: kPrimaryColor.withOpacity(0.5),
                    //   ),
                    // ),
                    // TextSpan(
                    //   text: "ห้อง ${data.roomnumber}".toUpperCase(),
                    //   style: TextStyle(
                    //     color: kPrimaryColor.withOpacity(0.5),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
    // Size size = MediaQuery.of(context).size;
    // return Container(
    //   margin: EdgeInsets.only(
    //     left: kDefaultPadding,
    //     top: kDefaultPadding / 2,
    //     bottom: kDefaultPadding * 2.5,
    //   ),
    //   width: size.width * 0.5,
    //   child: Column(
    //     children: <Widget>[
    // Image(
    //   height: 150,
    //   width: 150,
    //   image: NetworkImage(getImageUrl('${data.photo}')),
    // ),
    //       // Image.network(
    //       //     'https://images.clipartlogo.com/files/istock/previews/9323/93235669-vector-repair-icon-blue-wrench-black-gear-logo-vector-illustration.jpg'),
    //       GestureDetector(
    //         onTap: press,
    //         child: Container(
    //           // padding: EdgeInsets.all(kDefaultPadding / 2),
    //           decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(10),
    //                 bottomRight: Radius.circular(10),
    //               ),
    //               boxShadow: [
    //                 BoxShadow(
    //                   offset: Offset(0, 10),
    //                   blurRadius: 50,
    //                   color: kPrimaryColor.withOpacity(0.23),
    //                 )
    //               ]),
    // child: Row(
    //   children: <Widget>[
    //     RichText(
    //       text: TextSpan(
    //         children: [
    //           TextSpan(
    //             text: "${data.repairname}\n".toUpperCase(),
    //             style: Theme.of(context).textTheme.button,
    //           ),
    //           TextSpan(
    //             text: " ${data.dormitoryX}".toUpperCase(),
    //             style: TextStyle(
    //               color: kPrimaryColor.withOpacity(0.5),
    //             ),
    //           ),
    //           TextSpan(
    //             text: "ห้อง ${data.roomnumber}".toUpperCase(),
    //             style: TextStyle(
    //               color: kPrimaryColor.withOpacity(0.5),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

// class RepairCardBox extends StatefulWidget {
//   const RepairCardBox({Key key}) : super(key: key);

//   @override
//   _RepairCardBoxState createState() => _RepairCardBoxState();
// }

// class _RepairCardBoxState extends State<RepairCardBox> {
//   bool isLoad = true;
//   List<Bill> myData = [];
//   List<Bill> requestedStatus = [];
//   List<Bill> repairConfirm = [];
//   final bool isSidebarOpened = false;
//   final _animationDuration = const Duration(milliseconds: 500);

//   String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";

//   Timer _timer;

//   initialAction() async {
//     final List<Bill> res = await ActionGet.getSheetData();
//     print("res ----> ${res.runtimeType}");

//     res.sort(
//         (Bill a, Bill b) => b.informationDate.compareTo(a.informationDate));

//     print(res.toString());
//     final List<Bill> msg_0 =
//         res.where((element) => element.msg == "0").toList();
//     final List<Bill> msg_1 =
//         res.where((element) => element.msg == "1").toList();

//     setState(() {
//       requestedStatus = msg_0;
//       repairConfirm = msg_1;
//       isLoad = false;
//     });
//   }

//   @override
//   void initState() {
//     initialAction();
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       initialAction();
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _timer.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           isLoad == true
//               ? SpinKitPouringHourGlassRefined(color: kPrimaryColor)
//               : requestedStatus.length > 0
//                   ? ListView.builder(
//                       itemCount: requestedStatus.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return RepairCard(
//                           data: requestedStatus[index],
//                         );
//                       },
//                     )
//                   : Center(child: Text("No Requested Now")),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:project_app/constants.dart';
// import 'package:project_app/model/bill.dart';

// class RepairCard extends StatelessWidget {
//   const RepairCard({Key key, this.press, this.data}) : super(key: key);

//   final Function press;
//   final Bill data;
//   String getImageUrl(String url) {
//     String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
//     List<String> afterSplit = url.split("=");
//     return googleDriveUrl + afterSplit.last;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(
//         left: kDefaultPadding,
//         top: kDefaultPadding / 2,
//         bottom: kDefaultPadding * 2.5,
//       ),
//       width: size.width * 0.4,
//       child: Column(
//         children: <Widget>[
//           Image(width: 100, image: NetworkImage(getImageUrl('${data.photo}'))),
//           GestureDetector(
//             onTap: press,
//             child: Container(
//               padding: EdgeInsets.all(kDefaultPadding / 2),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       offset: Offset(0, 10),
//                       blurRadius: 50,
//                       color: kPrimaryColor.withOpacity(0.23),
//                     )
//                   ]),
//               child: Row(
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "${data.repairname}\n".toUpperCase(),
//                           style: Theme.of(context).textTheme.button,
//                         ),
//                         TextSpan(
//                           text:
//                               "${DateTime.parse(data.informationDate).toLocal().day}/${DateTime.parse(data.informationDate).toLocal().month}/${DateTime.parse(data.informationDate).toLocal().year}\n${DateTime.parse(data.informationDate).toLocal().hour}:${DateTime.parse(data.informationDate).toLocal().minute} น. "
//                                   .toUpperCase(),
//                           style: TextStyle(
//                             color: kPrimaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                         TextSpan(
//                           text: "หอพัก : ${data.dormitoryX} ".toUpperCase(),
//                           style: TextStyle(
//                             color: kPrimaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                         TextSpan(
//                           text: "ห้อง : ${data.roomnumber} ".toUpperCase(),
//                           style: TextStyle(
//                             color: kPrimaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
