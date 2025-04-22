import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/components/candidate_card.dart';
import 'package:voting_app/components/vote_button.dart';

class VotingApp extends StatefulWidget {
  final bool? voteStatus;
  const VotingApp({super.key, this.voteStatus});

  @override
  State<VotingApp> createState() => _VotingAppState();
}

class _VotingAppState extends State<VotingApp> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Expanded(child: VotingPage()),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: VoteButton(onPressed: () => {
             Navigator.pop<bool>(context, true), // Placeholder for vote action; TO DO: Change to actual logic 
          }),
        ),
      ],
    );
  }
}

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(spacing: 24.0, children: [TextSection(), CardSection()]),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "It's time to cast your vote!",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        CustomCard(name: "GABAYERON, GJP", affiliation: "Independent"),
        CustomCard(name: "RONDAEL, VO", affiliation: "Independent"),
        CustomCard(name: "JALANDONI, JM", affiliation: "Independent"),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(75),
              blurRadius: 3,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/brand-logo.png",
                height: 50,
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
