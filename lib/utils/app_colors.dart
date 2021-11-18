
import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor get black => _blackPrimaryColor.toMaterialColor();
  static MaterialAccentColor get red =>
      _redPrimaryColor.toMaterialAccentColor();
  static const Color _blackPrimaryColor = Color(0xFF1C1D1D);
  static const Color _redPrimaryColor = Color(0xFFEF3534);
}

extension _Material on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

//MaterialColor: Defines a single color as well a color swatch with ten shades of the color.
  MaterialColor toMaterialColor() => MaterialColor(
        value,
        _toSwatch(),
      );

  MaterialAccentColor toMaterialAccentColor() => MaterialAccentColor(
        value,
        _toSwatch(),
      );
}
