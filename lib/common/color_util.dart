import 'package:flutter/material.dart';

extension ColorUtil on Color {
  Color darkeny([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighteny([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color accentDependentOnLuminance() {
    if(computeLuminance() > 0.5) {
      return darkeny(.1);
    }

    return lighteny(.1);
  }
}
