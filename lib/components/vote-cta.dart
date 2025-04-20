import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/color_theme.dart';

class VoteCTA extends StatelessWidget {
  final double height = 100.0;
  const VoteCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -height / 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          child: Container(
            height: height,
            width: double.maxFinite,
            color: Palette.buttonDefaultBackground,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VotingInfo(),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 48.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VotingInfo extends StatelessWidget {
  const VotingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Cast your vote now!",
            style: GoogleFonts.poppins(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          Row(
            spacing: 8.0,
            children: [
              LiveButton(),
              Text(
                "Voting is now open",
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LiveButton extends StatelessWidget {
  const LiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            "LIVE",
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
