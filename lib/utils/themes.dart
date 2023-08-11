import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichPanelTheme {
  static const Color primaryColor = Color.fromRGBO(20, 46, 98, 1);
  static const Color primaryLightColor = Color.fromRGBO(94, 120, 169, 1);
  static const Color grey = Color.fromRGBO(187, 187, 189, 0.2);
  static const Color shadowColor = Color(0xFF000000);
}

class RichPanelTextStyle {
  static final TextStyle bodyMedium = _createFont(
    sizePx: 14,
    spacingPc: 0.35,
    weight: FontWeight.normal,
  );

  static TextStyle _createFont({
    required double sizePx,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    sizePx *= 1;
    if (heightPx != null) {
      heightPx *= 1;
    }
    return GoogleFonts.poppins(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : null,
      letterSpacing: spacingPc != null ? sizePx * spacingPc * 0.01 : null,
      fontWeight: weight,
      color: CupertinoColors.black,
    );
  }

  static final h2 = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static final h5 = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

class RichPanelShadows {
  // Base
  static final BoxShadow level1 = BoxShadow(
    color: RichPanelTheme.shadowColor.withOpacity(0.06),
    blurRadius: 14,
    offset: const Offset(0, 3),
  );

  static final BoxShadow level2 = BoxShadow(
    color: RichPanelTheme.shadowColor.withOpacity(0.06),
    blurRadius: 28,
    offset: const Offset(0, 3),
  );

  // Custom
  static final BoxShadow iconContainer = BoxShadow(
    color: RichPanelTheme.shadowColor.withOpacity(0.12),
    blurRadius: 20,
    offset: const Offset(0, 8),
    spreadRadius: -8,
  );
}
