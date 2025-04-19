import 'package:flutter/material.dart';
import 'package:voting_app/components/header_image.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [HeaderImage()]));
  }
}
