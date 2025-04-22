import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/color_theme.dart';

class VoteCTA extends StatefulWidget {
  final bool? voteStatus;

  const VoteCTA({super.key, this.voteStatus});

  @override
  State<VoteCTA> createState() => _VoteCTAState();
}

class _VoteCTAState extends State<VoteCTA> {
  String titleText = "";
  String subtitleText = "";
  Color? color;

  @override
  Widget build(BuildContext context) {
    if (widget.voteStatus!) {
      color = Palette.buttonAlternativeBackground;
      titleText = "Already voted!";
      subtitleText = "Verify your vote";
    } else {
      color = Palette.buttonDefaultBackground;
      titleText = "Cast your vote now!";
      subtitleText = "Voting is now open";
    }

    return Transform.translate(
      offset: const Offset(0.0, -44.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          child: Container(
            width: double.maxFinite,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VotingInfo(title: titleText, subtitle: subtitleText),
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
  final String title;
  final String subtitle;
  const VotingInfo({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,
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
                subtitle,
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
