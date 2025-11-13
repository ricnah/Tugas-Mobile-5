import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const KelasSahamApp());
}

class KelasSahamApp extends StatelessWidget {
  const KelasSahamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelas Saham',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
