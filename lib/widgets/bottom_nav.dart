import 'package:flutter/material.dart';

import '../splash/splash.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // Wrap with a Container to provide constraints
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              // Your logic for the first icon
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              print('Home icon pressed!');
            },
            child: Icon(
              Icons.home,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
