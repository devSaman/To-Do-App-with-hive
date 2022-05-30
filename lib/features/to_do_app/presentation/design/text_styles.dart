import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/features/to_do_app/presentation/design/colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get titleFont => GoogleFonts.inter(
      color: Palette.secondary, fontSize: 18.0, fontWeight: FontWeight.w800);

  static TextStyle get buttonFont => GoogleFonts.inter(
      color: Palette.white, fontSize: 14.0, fontWeight: FontWeight.bold);

   static TextStyle get subtitleFont => GoogleFonts.inter(
      color: Palette.white, fontSize: 12.0, fontWeight: FontWeight.bold);

  static TextStyle get inputFont => GoogleFonts.inter(
      color: Palette.primary, fontSize: 14.0, fontWeight: FontWeight.w800);

  static TextStyle get inputTitleFont => GoogleFonts.inter(
      color: Palette.primary.withAlpha(0x7F),
      fontSize: 12.0,
      fontWeight: FontWeight.w600);

  static TextStyle get instructionFont => GoogleFonts.inter(
      color: Palette.secondary, fontSize: 14.0, fontWeight: FontWeight.w800);

  static TextStyle get buttonTextFont => GoogleFonts.inter(
      color: Palette.white, fontSize: 24.0, fontWeight: FontWeight.w600);

  static TextStyle get bodyFont => GoogleFonts.inter(
      color: Palette.primary, fontSize: 14.0, fontWeight: FontWeight.w600);

}
