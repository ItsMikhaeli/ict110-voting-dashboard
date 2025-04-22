import 'package:flutter/material.dart';
import 'package:voting_app/components/header_image.dart';
import 'package:voting_app/components/vote_cta.dart';
import 'package:voting_app/pages/vote_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool userHasVoted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderImage(),
          GestureDetector(
            onTap: () async {
              bool? response = await Navigator.push(context, 
                MaterialPageRoute(builder: (context) {
                  return const VotingApp();
                }));
              
              if (response != null) {
                setState(() {
                  userHasVoted = response;
                });
              }
            },
            child: VoteCTA(voteStatus: userHasVoted),
          ),
        ],
      ),
    );
  }
}
