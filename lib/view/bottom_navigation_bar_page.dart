import 'package:flutter/material.dart';
import 'package:trademobile/view/home_page.dart';
import 'package:trademobile/view/profile_page.dart';
import 'package:trademobile/view/sales_page.dart';

class BottonNavigationPage extends StatefulWidget {
  const BottonNavigationPage({super.key});

  @override
  State<BottonNavigationPage> createState() => _BottonNavigationPageState();
}

class _BottonNavigationPageState extends State<BottonNavigationPage> {
   int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 45,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add,size: 45,), label: "Sales"),
           BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,size: 45,), label: "Profile")
        ],
        onTap: (v) {
          setState(() {
            _currentIndex = v.toInt();
          });
        },
      ),
      
      
    );
    
  }
  final List<Widget>  _screens = [
 const  HomePage(),
 const SalesPage(),
 const ProfilePage()
 
  ];
}