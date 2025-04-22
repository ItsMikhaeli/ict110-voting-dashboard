import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/color_theme.dart';

class CustomCard extends StatefulWidget {
  final String name;
  final String affiliation;

  const CustomCard({super.key, required this.name, required this.affiliation});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isSelected = false;
  bool _isDisabled = false;

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        _isSelected
            ? Palette.cardSelectedBackground
            : Palette.cardDefaultBackground;
    Color accentColor =
        _isSelected ? Palette.cardSelectedAccent : Palette.cardDefaultAccent;
    double opacity = _isDisabled ? 0.5 : 1.0;

    return GestureDetector(
      onTap: _toggleSelected,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: backgroundColor.withValues(alpha: opacity),
          child: Row(
            spacing: 12.0,
            children: [
              CandidateImage(),
              CandidateDetails(
                name: widget.name,
                affiliation: widget.affiliation,
              ),
              CardDesign(color: accentColor.withValues(alpha: opacity)),
            ],
          ),
        ),
      ),
    );
  }
}

class CandidateImage extends StatelessWidget {
  const CandidateImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 75.0,
      height: 75.0,
      child: Placeholder(color: Colors.grey),
    );
  }
}

class CandidateDetails extends StatefulWidget {
  final String name;
  final String affiliation;

  const CandidateDetails({
    super.key,
    required this.name,
    required this.affiliation,
  });

  @override
  State<CandidateDetails> createState() => _CandidateDetailsState();
}

class _CandidateDetailsState extends State<CandidateDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Palette.cardText,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.affiliation,
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Palette.cardText,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class CardDesign extends StatefulWidget {
  final Color color;
  const CardDesign({super.key, required this.color});

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.0,
      height: 75.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(24.0, 0.0),
            child: Transform.rotate(
              angle: pi / 4,
              child: SizedBox(
                width: 75.0,
                height: 75.0,
                child: ColoredBox(color: widget.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
