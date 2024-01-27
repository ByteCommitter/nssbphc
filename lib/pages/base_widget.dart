import 'package:flutter/material.dart';
import 'package:nssbphc/pages/Dashboard/DashboardPage.dart';
import 'package:nssbphc/pages/Events/EventsScreen.dart';
import 'package:nssbphc/pages/Merch/merchandiseScreen.dart';
import 'package:nssbphc/pages/More/MorePage.dart';
import 'package:nssbphc/pages/Profile/ProfilePage.dart';

class BaseScreen extends StatefulWidget{
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  
  @override
  void initState(){
    super.initState();
  }

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 0,
        title:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "N S S",
                          style:
                          TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
           
            EventPage(),

            MerchPage(),

            DashboardPage(),
          
            ProfilePage(),

            MorePage()

        ],
      ),
      
      

      //Bottom Navigation Bar:
      bottomNavigationBar: BottomNavigationBar(
        //decoration of the bar
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
        iconSize: 34,
        selectedItemColor: const Color.fromARGB(255, 248, 213, 16),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0, 
        //to do with the different pages in the bar
    items: const <BottomNavigationBarItem>[

      BottomNavigationBarItem(
        icon: Icon(Icons.event_outlined),
        label: "Events",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        label: "Merch",
      ),
      
      BottomNavigationBarItem(
        icon: Icon(Icons.space_dashboard_outlined),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_outlined),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_outlined),
        label: 'More',
      ),
    ],
    currentIndex: _selectedIndex, //New
    onTap: _onItemTapped,
  ),
  

      
    );
  }
}


