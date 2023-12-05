import 'package:flutter/material.dart';

var lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF2196F3), // Light Blue
  onPrimary: Colors.white,
  secondary: Color(0xFFFFC107), // Light Amber
  onSecondary: Colors.black,
  surface: Color(0xFFFFFFFF), // Set a default surface color
  onSurface: Colors.black, // Set a default onSurface color
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF201A1B),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF64B5F6), // Light Blue
  onPrimaryContainer: Colors.white,
  secondaryContainer: Color(0xFFFFF59D), // Light Amber
  onSecondaryContainer: Colors.black,
  tertiary: Color(0xFF4CAF50), // Green
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFF81C784), // Light Green
  onTertiaryContainer: Colors.white,
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  surfaceVariant: Color(0xFFF2DDE1),
  onSurfaceVariant: Color(0xFF514347),
  outline: Color(0xFF837377),
  onInverseSurface: Color(0xFFFAEEEF),
  inverseSurface: Color(0xFF352F30),
  inversePrimary: Color(0xFFFFB1C8),
  shadow: Color(0xFF000000),
  surfaceTint: Colors.grey,
  outlineVariant: Color(0xFFD5C2C6),
  scrim: Color(0xFF000000),
);

var darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF673AB7), // Light Deep Purple
  onPrimary: Colors.white,
  secondary: Color(0xFFFF9800), // Light Orange
  onSecondary: Colors.black,
  surface: Color(0xFF201A1B),
  onSurface: Color(0xFFEBE0E1),
  background: Color(0xFF3C3233),
  onBackground: Color(0xFFEBE0E1),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  primaryContainer: Color(0xFF9575CD), // Light Deep Purple
  onPrimaryContainer: Colors.white,
  secondaryContainer: Color(0xFFFFCC80), // Light Orange
  onSecondaryContainer: Colors.black,
  tertiary: Color(0xFF00BCD4), // Cyan
  onTertiary: Colors.black,
  tertiaryContainer: Color(0xFF80DEEA), // Light Cyan
  onTertiaryContainer: Colors.black,
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  surfaceVariant: Color(0xFF514347),
  onSurfaceVariant: Color(0xFFD5C2C6),
  outline: Color(0xFF9E8C90),
  onInverseSurface: Color(0xFF201A1B),
  inverseSurface: Color(0xFFEBE0E1),
  inversePrimary: Color(0xFFB90063),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB1C8),
  outlineVariant: Color(0xFF514347),
  scrim: Color(0xFF000000),
);

final buttonStyleLight = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(
      color: Colors.black12,
      width: 0.5,
    ),
  ),
);

final buttonStyleDark = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(
      color: Colors.white24,
      width: 0.5,
    ),
  ),
  foregroundColor: Colors.white,
);
