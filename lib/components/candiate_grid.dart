import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateGrid extends StatelessWidget {
  final List<Candidate> candidates;

  const CandidateGrid({
    super.key,
    required this.candidates,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, -24.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Meet your cadidates",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              )
            ),
            Text(
              "Get to know the nominee by viewing its profile",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              )
            ),
            const SizedBox(height: 16.0),
            CandidateGridList(candidates: candidates),
          ],
        ),
      )
    );
  }
}

class CandidateGridList extends StatelessWidget {
  const CandidateGridList({
    super.key,
    required this.candidates,
  });

  final List<Candidate> candidates;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: candidate.image,
                ),
                const SizedBox(height: 8.0),
                Column(
                  spacing: 4.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      candidate.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text("${candidate.position} - ${candidate.party}")
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Candidate {
  final String name;
  final String position;
  final String party;
  final Image image;

  Candidate({
    required this.name,
    required this.position,
    required this.party,
    required this.image,
  });
}