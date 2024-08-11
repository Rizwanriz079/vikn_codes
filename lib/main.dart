import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_codes/screens/bottom.dart';
import 'package:vikn_codes/screens/dashboard.dart';
import 'package:vikn_codes/screens/filter.dart';
import 'package:vikn_codes/screens/login.dart';
import 'package:vikn_codes/screens/profile.dart';
import 'package:vikn_codes/screens/sale_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter App',

      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/bottom', page: () => BottomNavigationLayout()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/sale-list', page: () => SaleList()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/filter', page: () => FiltersScreen()),
      ],
    );
  }
}
