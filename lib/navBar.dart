import 'package:flutter/material.dart';

import 'package:onehearttour/pages/book/book.dart';
import 'package:onehearttour/pages/faq/faq.dart';
import 'package:onehearttour/pages/home/home.dart';


class BottomNavBar extends StatefulWidget{
  BottomNavBar({Key key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar>{
  int selectedIndex = 0;

  static List<Widget> routes = [
    HomePage(),
    BookPage(),
    FaqPage()
  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: routes.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff212121),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,color: Color(0xfffffd9e)),
            activeIcon: Icon(Icons.dashboard,color: Color(0xffffc021)),
            title: Text('Feed',style: TextStyle(color: Color(0xffffc021))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_invitation,color: Color(0xfffffd9e)),
            activeIcon: Icon(Icons.insert_invitation,color: Color(0xffffc021)),
            title: Text('Book',style: TextStyle(color: Color(0xffffc021))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer,color: Color(0xfffffd9e)),
            activeIcon: Icon(Icons.question_answer,color: Color(0xffffc021)),
            title: Text('FAQ',style: TextStyle(color: Color(0xffffc021))),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}