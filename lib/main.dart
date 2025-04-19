import 'package:flutter/material.dart';
import 'package:voting_app/pages/dashboard/dashboard.dart';
import 'package:voting_app/pages/voting-page/voting-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DashboardScreen(),
      home: VotingApp(),
    );
  }
}
