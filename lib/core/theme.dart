import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Material 3 light and dark themes (Fraunces headings, Nunito body).
class AppTheme {
  static const seed = Color(0xFF6D28D9);

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness b) {
    final cs = ColorScheme.fromSeed(seedColor: seed, brightness: b);
    final base = ThemeData(useMaterial3: true, colorScheme: cs);
    final body = GoogleFonts.nunitoTextTheme(base.textTheme);
    TextStyle display(TextStyle? s) =>
        GoogleFonts.fraunces(textStyle: s, fontWeight: FontWeight.w700);
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
    return base.copyWith(
      textTheme: body.copyWith(
        displaySmall: display(body.displaySmall),
        headlineMedium: display(body.headlineMedium),
        headlineSmall: display(body.headlineSmall),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        titleTextStyle: display(body.titleLarge).copyWith(color: cs.onSurface),
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(minimumSize: const Size(0, 52), shape: shape)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(minimumSize: const Size(0, 52), shape: shape)),
    );
  }
}
