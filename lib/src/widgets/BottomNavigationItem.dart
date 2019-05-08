import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem {
  
  BottomNavigationBarItem buildBottomNavigationBarItem(String imagePath,  String title){
    return BottomNavigationBarItem(
      
      icon: Stack(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 6.0),
            child: Image.asset(
              imagePath,
              height: 26.0,
            ),
          ),
        ],
      ),
      activeIcon: Image.asset(
        imagePath,
        height: 26.0,
      ),
      title: Text(title,style: TextStyle(color:  Colors.black,))
    );
  }
}