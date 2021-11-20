import 'package:flutter/material.dart';
import 'package:project_app/Screens/details/details_screens.dart';
import 'package:project_app/constants.dart';

class ConfirmRepairCardBox extends StatelessWidget {
  const ConfirmRepairCardBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ConfirmRepairCard(
            title: 'Papavarin',
            domitory: '3',
            room: '213',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          ConfirmRepairCard(
            title: 'Papavarin',
            domitory: '3',
            room: '213',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          ConfirmRepairCard(
            title: 'Papavarin',
            domitory: '3',
            room: '213',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          ConfirmRepairCard(
            title: 'Papavarin',
            domitory: '3',
            room: '213',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ConfirmRepairCard extends StatelessWidget {
  const ConfirmRepairCard({
    Key key,
    this.image,
    this.title,
    this.domitory,
    this.room,
    this.press,
  }) : super(key: key);
  final String image, title, domitory, room;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.network(
              'https://st2.depositphotos.com/50337402/47099/v/380/depositphotos_470993878-stock-illustration-adjustable-spanner-blue-red-four.jpg'),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "หอ $domitory ".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "ห้อง $room".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
