import 'package:flutter/material.dart';
import 'package:job_task/controller/provider/category_provider.dart';
import 'package:job_task/controller/provider/fav_provider.dart';
import 'package:job_task/controller/provider/product_provider.dart';
import 'package:job_task/view/category_screen.dart';
import 'package:job_task/view/fav_screen.dart';
import 'package:job_task/view/home_screen.dart';
import 'package:job_task/view/mitt_konto_screen.dart';
import 'package:job_task/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
         ChangeNotifierProvider(create: (_) => CategoryProvider()),
         ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/category': (context) => CategoryScreen(),
          '/mittokonto': (context) => MittKontoScreen(),
          '/fav': (context) => FavoritesScreen(),
        },
      ),
    );
  }
}
