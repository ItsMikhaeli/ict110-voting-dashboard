import 'package:flutter/material.dart';
import 'package:voting_app/pages/dashboard.dart';
// import 'package:voting_app/pages/vote_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
      // routes: {'/vote': (context) => const VotingApp()},
    );
  }
}
