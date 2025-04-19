import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          ImageSection(image: "assets/images/header-image.png"),
          Gradient(),
          HeaderContents(),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  final String image;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, fit: BoxFit.cover, width: width, height: width);
  }
}

class Gradient extends StatelessWidget {
  const Gradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.0), Colors.white],
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}

class HeaderContents extends StatelessWidget {
  const HeaderContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12.0,
        children: [HeaderLogo(), HeaderText()],
      ),
    );
  }
}

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSection(
      image: "assets/images/header-logo.png",
      width: 100.0,
      height: 100.0,
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hi Juan!",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
