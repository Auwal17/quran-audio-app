import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Application Typography
class AppTypography {
  // Arabic Font (Amiri)
  static TextStyle arabicDisplayLarge = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static TextStyle arabicDisplayMedium = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  static TextStyle arabicHeadlineLarge = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );

  static TextStyle arabicHeadlineSmall = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle arabicBodyLarge = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static TextStyle arabicBodyMedium = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  // English Font (Poppins)
  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static TextStyle labelLarge = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle labelMedium = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );
}
