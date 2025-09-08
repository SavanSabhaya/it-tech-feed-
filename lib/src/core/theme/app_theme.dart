import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color darkBgTop = Color(0xFF0C1222);
  static const Color darkBgBottom = Color(0xFF0A0F1A);
  static const Color accentBlue = Color(0xFF2CD2F7);
  static const Color accentPurple = Color(0xFF9B5CFF);
  static const Color cardOutline = Color(0xFF6E55D9);

  static ThemeData buildTheme() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: accentPurple,
        secondary: accentBlue,
      ),
    );
  }
}
