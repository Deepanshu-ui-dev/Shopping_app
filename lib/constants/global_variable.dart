import 'package:flutter/material.dart';

/// Design tokens compatible with ShadcnUI theme.
/// Use `ShadTheme.of(context)` for runtime access.
/// These constants are for places where context is unavailable.
class GlobalVariable {
  // ── User Provided Light Palette ─────────────────────────────
  static const primaryColor = Color(0xFF6367FF);
  static const secondaryColor = Color(0xFF8494FF);
  static const accentSoft = Color(0xFFC9BEFF);
  static const highlightColor = Color(0xFFFFDBFD);

  // ── Shorthand aliases ─────────────────────────────────────────
  static const backgroundColor = Color(0xFFFFFFFF);
  static const Color greyBackgroundCOlor = Color(0xFFF4F4F5);
  static var selectedNavBarColor = primaryColor;
  static const unselectedNavBarColor = Color(0xFF71717A);
  
  // ── Gradients ─────────────────────────────────────────────────
  static const brandGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}