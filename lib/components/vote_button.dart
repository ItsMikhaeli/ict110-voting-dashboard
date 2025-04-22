import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/color_theme.dart';

class VoteButton extends StatefulWidget {
  final bool voteStatus;
  final Function ()? onPressed;
  const VoteButton({
    super.key,
    required this.voteStatus,
    required this.onPressed,
  });

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
              color: widget.voteStatus ? Palette.buttonAlternativeBackground : Palette.buttonDefaultBackground,
              onPressed: widget.onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  widget.voteStatus ? "Go Back" : "Vote",
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
