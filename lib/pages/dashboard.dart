import 'package:flutter/material.dart';
import 'package:voting_app/components/header_image.dart';
import 'package:voting_app/components/vote-cta.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderImage(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/vote"),
            child: VoteCTA(),
          ),
        ],
      ),
    );
  }
}
