import 'dart:async';

import 'package:flutter/material.dart';

class PageYesterday extends StatefulWidget {
  @override
  _PageYesterdayState createState() => _PageYesterdayState();
}

class _PageYesterdayState extends State<PageYesterday> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('PageYesterday'),
          Center(
              child: Image(
            height: 150,
            width: 150,
            image: NetworkImage(
                "https://drive.google.com/uc?export=view&id=1lzZBMkC9be3THrr85ZB31YyEXjh3Fk-r"),
          )),
        ],
      ),
    );
  }
}
