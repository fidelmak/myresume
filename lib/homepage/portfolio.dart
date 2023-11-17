import 'package:flutter/material.dart';
import '../../constants/constants.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/card.dart';
import '../widgets/project_card.dart';
//import '../house_list/categories.dart';

//import 'card.dart';

class Porfolio extends StatefulWidget {
  const Porfolio({super.key});
  static String id = 'user';

  @override
  State<Porfolio> createState() => _PorfolioState();
}

class _PorfolioState extends State<Porfolio> {
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
            'My projects',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: AppColors.darkColor,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ProjectCard(
            projectName: 'My Awesome Project',
            images: [
              'assets/images/home.jpeg',
              'assets/images/home.jpeg',
            ],
            githubRepoUrl: 'https://github.com/yourusername/yourproject',
          ),
          SizedBox(
            height: 10,
          ),
          ProjectCard(
            projectName: 'My Awesome Project',
            images: [
              'assets/images/img1.jpeg',
              'assets/images/img2.png',
            ],
            githubRepoUrl: 'https://github.com/yourusername/yourproject',
          ),
          SizedBox(
            height: 10,
          ),
          ProjectCard(
            projectName: 'My Awesome Project',
            images: [
              'assets/images/in.jpeg',
              'assets/images/in.jpeg',
            ],
            githubRepoUrl: 'https://github.com/yourusername/yourproject',
          ),
          SizedBox(
            height: 10,
          ),
          ProjectCard(
            projectName: 'My Awesome Project',
            images: [
              'assets/images/ani.jpeg',
              'assets/images/ani.jpeg',
            ],
            githubRepoUrl: 'https://github.com/yourusername/yourproject',
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
