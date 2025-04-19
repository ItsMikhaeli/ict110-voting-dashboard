import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/color-theme.dart';

class VoteButton extends StatefulWidget {
  const VoteButton({super.key});

  @override
  State<VoteButton> createState() => _VoteButtonState();
}

class _VoteButtonState extends State<VoteButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99.0),
            child: MaterialButton(
              color: Palette.buttonDefaultBackground,
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Vote",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
