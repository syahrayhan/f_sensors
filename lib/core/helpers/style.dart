import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double outsidePadding = 16;

final TextTheme appTextTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
      fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.inter(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w700),
  headlineMedium: GoogleFonts.inter(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
  titleLarge: GoogleFonts.inter(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
  bodySmall: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.inter(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: appTextTheme,
);
