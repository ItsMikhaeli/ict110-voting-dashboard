import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/components/candiate_grid.dart';
import 'package:voting_app/components/candidate_card.dart';
import 'package:voting_app/components/vote_button.dart';

class VotingApp extends StatefulWidget {
  final bool voteStatus;
  final List<Candidate> candidateList;
  const VotingApp({
    super.key,
    required this.voteStatus,
    required this.candidateList,
  });

  @override
  State<VotingApp> createState() => _VotingAppState();
}

class _VotingAppState extends State<VotingApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Expanded(
          child: VotingPage(
            voteStatus: widget.voteStatus,
            candidateList: widget.candidateList,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: VoteButton(
            voteStatus: widget.voteStatus,
            onPressed: () => {Navigator.pop<bool>(context, true)},
          ),
        ),
      ],
    );
  }
}

class VotingPage extends StatelessWidget {
  final bool voteStatus;
  final List<Candidate> candidateList;
  const VotingPage({
    super.key,
    required this.voteStatus,
    required this.candidateList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 24.0,
        children: [
          TextSection(voteStatus: voteStatus),
          CardSection(candidates: candidateList, isDisabled: voteStatus),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final bool voteStatus;
  const TextSection({super.key, required this.voteStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          voteStatus ? "Verify your vote!" : "It's time to cast your vote!",
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
  final List<Candidate> candidates;
  final bool isDisabled;
  const CardSection({
    super.key,
    required this.candidates,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children:
          candidates
              .where((candidate) => candidate.position == "President")
              .map((candidate) {
                return Opacity(
                  opacity: isDisabled ? 0.5 : 1,
                  child: CustomCard(
                    candidateImage: candidate.image,
                    name: candidate.name,
                    affiliation: candidate.party,
                    // onTap:
                    //     () => {
                    //       if (!isDisabled)
                    //         {
                    //           // Implement on tap option logic here
                    //         },
                    //     },
                  ),
                );
              })
              .toList(),
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
