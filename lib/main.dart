import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/home_page.dart';
import 'package:flutter_ebook_app/navigation/routes.dart';
import 'package:flutter_ebook_app/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        Routes.defaultRoute: (context) => const HomePage(),
        Routes.home: (context) => const HomePage(),
        Routes.playerScreen: (context) => const PlayerScreen(),
      },
    );
  }
}
