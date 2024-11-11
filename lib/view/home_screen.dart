// screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:job_task/view/category_screen.dart';
import 'package:job_task/view/fav_screen.dart';
import 'package:job_task/view/mitt_konto_screen.dart';
import 'package:job_task/view/product_scree.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProductsScreen(),
    CategoryScreen(),
   FavoritesScreen(),
    MittKontoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Products',backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories',backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites',backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Mitt konto',backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
          backgroundColor: Colors.black,            
        selectedItemColor: Colors.white,        
        unselectedItemColor: Colors.white,  
      ),
    );
  }
}
