import 'package:flutter/material.dart';
import '../../constants/constants.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/card.dart';
import 'portfolio.dart';
//import '../house_list/categories.dart';

//import 'card.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});
  static String id = 'user';

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // int _page = 0;
  // bool _isHovered = false;
  //GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        toolbarHeight: 60,
        title: Center(
          child: Text(
            'My portfolio',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: AppColors.darkColor,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: null,
          ),
          CreditCardWidget(),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Porfolio()));
            },
            child: myCardTag(
                'About Me  ',
                Icon(
                  Icons.image,
                  color: Colors.green,
                ),
                'details about me '),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Porfolio()));
            },
            child: myCardTag(
                'My Projects   ',
                Icon(
                  Icons.image,
                  color: Colors.green,
                ),
                'checkout my flutter apps '),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Porfolio()));
            },
            child: myCardTag(
                'My technical Stories ',
                Icon(
                  Icons.image,
                  color: Colors.green,
                ),
                'learn about flutter and more '),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Porfolio()));
            },
            child: myCardTag(
                'Contact Me  ',
                Icon(
                  Icons.image,
                  color: Colors.green,
                ),
                'get in contact with me  '),
          ),
        ],
      )),
    );
  }

  Container myCardTag(String heading, Icon icon, String text) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading,
                style: TextStyle(color: AppColors.textColor, fontSize: 14)),
            Text(text,
                style: TextStyle(color: AppColors.textColor, fontSize: 10)),
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: AppColors.backGroundOne),
      ),
    );
  }
}
