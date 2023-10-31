import 'package:flutter/material.dart';

class ShowBottom extends StatefulWidget {
  @override
  State<ShowBottom> createState() => _ShowBottomState();
}

class _ShowBottomState extends State<ShowBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
