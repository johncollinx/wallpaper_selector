import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  final bool isWide;
  const HeroSection({required this.isWide, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFFB74D), Color(0xFFE91E63)],
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: Text(
            'Discover Beautiful Wallpapers',
            style: GoogleFonts.poppins(
              fontSize: isWide ? 64 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: 780,
          child: Text(
            'Curated collections of stunning wallpapers. Browse by category, preview, and set your favorites.',
            style: GoogleFonts.poppins(
                fontSize: 18, height: 1.4, color: const Color(0xFF6D6D6D)),
          ),
        ),
      ],
    );
  }
}
