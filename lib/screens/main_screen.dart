import 'package:flutter/material.dart';
import 'package:water_social_media/screens/login_screen.dart';
import 'package:water_social_media/services/auth.dart';
import 'profile_screen.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  List<Widget> _pageOptions = <Widget>[
    DashboardScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H20'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  AuthService _auth = AuthService();
                  _auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue[700],
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            title: Text('Profile'),
          ),
        ],
      ),
      body: _pageOptions.elementAt(_selectedIndex),
    );
  }
}