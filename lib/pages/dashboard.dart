import 'package:flutter/material.dart';
import 'package:voting_app/components/candiate_grid.dart';
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

  // Placeholder for candidates data; TO DO: Change to actual data source
  final List<Candidate> candidates = [
    Candidate(
      name: "VINCE OMAR RONDAEL",
      position: "President",
      party: "Party A",
      image: Image.asset("assets/images/RONDAEL.jpg"),
    ),
    Candidate(
      name: "GEGER JOHN PAUL GABAYERON",
      position: "Vice President",
      party: "Party B",
      image: Image.asset("assets/images/GABAYERON.jpg"),
    ),
    Candidate(
      name: "JOSEPH MIKHAELI JALANDONI",
      position: "Secretary",
      party: "Party C",
      image: Image.asset("assets/images/JALANDONI.jpg"),
    ),
    Candidate(
      name: "KATE ANGEL ABAD",
      position: "Asst. Secretary",
      party: "Party D",
      image: Image.asset("assets/images/ABAD.jpg"),
    ),
    Candidate(
      name: "SUETTE KEY SIMOY",
      position: "Secretary",
      party: "Party C",
      image: Image.asset("assets/images/SIMOY.jpg"),
    ),
  ];

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
                  return VotingApp(voteStatus: userHasVoted);
                }));
              
              if (response != null) {
                setState(() {
                  userHasVoted = response;
                });
              }
            },
            child: VoteCTA(voteStatus: userHasVoted),
          ),
          CandidateGrid(candidates: candidates)
        ],
      ),
    );
  }
}
