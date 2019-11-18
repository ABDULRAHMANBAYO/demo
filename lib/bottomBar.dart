import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Message',
      style: optionStyle,
    ),
     Text(
      'Index 2: Business',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.th,color: Colors.black,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.envelope,color: Colors.black,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business,color: Colors.black,),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.clock_o,color: Colors.black,),
            title: Text('School'),
          ),
           BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,color: Colors.black,),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      
    );
  }
}
