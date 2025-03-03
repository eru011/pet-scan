import 'package:flutter/material.dart';

class Col {
  // Background Colors
  static const Color background =
      Color.fromARGB(255, 223, 223, 223); // Light Gray
  static const Color cardBackground = Color(0xFFFFFFFF); // White

  // Primary & Secondary Colors
  static const Color primary = Color.fromARGB(255, 27, 77, 62); // Deep Green
  static const Color secondary = Color(0xFF000000); // Black

  // Text Colors
  static const Color textPrimary =
      Color(0xFF000000); // Black (same as secondary)
  static const Color textSecondary =
      Color(0xFF4E4E4E); // Dark Gray for contrast

  // Highlight & Icons
  static const Color highlight =
      Color(0xFF328E61); // Using primary as highlight
  static const Color subHighlight =
      Color(0xFF4E4E4E); // Using secondary as highlight
}

// Usage Example:
// Container(color: ColorPalette.background)
