import 'package:flutter/material.dart';
import 'package:voting_app/components/header_image.dart';
import 'package:voting_app/components/vote-cta.dart';

class DashboardScreen extends StatelessWidget {
  final bool userHasVoted;
  const DashboardScreen({super.key, this.userHasVoted = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderImage(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/vote"),
            child: VoteCTA(voteStatus: userHasVoted),
          ),
        ],
      ),
    );
  }
}
