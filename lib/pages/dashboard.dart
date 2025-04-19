import 'package:flutter/material.dart';
import 'package:voting_app/pages/header_image.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [HeaderImage()]));
  }
}
