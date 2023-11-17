import 'package:flutter/material.dart';
//import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../constants/constants.dart';

class CreditCardWidget extends StatelessWidget {
  final Color themeColor;
  final bool collapsed;
  const CreditCardWidget({
    this.themeColor = Colors.white,
    this.collapsed = false,
  });
  @override
  Widget build(BuildContext context) {
    return _buildExpanded(context);
  }

  Widget _buildExpanded(BuildContext context) {
    double rowWidth = MediaQuery.of(context).size.width;
    Color color = themeColor == Colors.white ? Colors.black : Colors.white;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 1, 33, 58),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: AppColors.backGround,
              blurRadius: 200.0,
              spreadRadius: 0.1,
              offset: Offset(0.0, 10.0)),
          BoxShadow(color: Colors.white, blurRadius: 300.0, spreadRadius: 10.5)
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/ani.jpeg"),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            width: rowWidth * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Akintunde Oluborode',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.edit_note_outlined,
                      color: Colors.green,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "'Dont stop learning no matter \n the situation'",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.green),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 25,
                child: SizedBox(
                  height: 20,
                  child: Container(
                    height: 20,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors
                            .green), // Set the desired background color here
                      ),
                      onPressed: () {},
                      child: Text(
                        'Github',
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
