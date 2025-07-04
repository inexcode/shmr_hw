import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocaleNumberInputFormatter extends TextInputFormatter {
  LocaleNumberInputFormatter(this.locale);

  final Locale locale;

  @override
  TextEditingValue formatEditUpdate(
    final TextEditingValue oldValue,
    final TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit and non-dot characters
    final cleanText = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

    // Ensure only one decimal point
    final parts = cleanText.split('.');
    if (parts.length > 2) {
      return oldValue;
    }

    // Limit decimal places to 2
    if (parts.length == 2 && parts[1].length > 2) {
      return oldValue;
    }

    // Don't format if user is still typing decimal places
    if (cleanText.endsWith('.') ||
        (parts.length == 2 &&
            parts[1].length < 2 &&
            newValue.text.endsWith(parts[1]))) {
      return TextEditingValue(
        text: cleanText,
        selection: TextSelection.collapsed(offset: cleanText.length),
      );
    }

    final number = double.tryParse(cleanText);
    if (number == null) {
      return TextEditingValue(
        text: cleanText,
        selection: TextSelection.collapsed(offset: cleanText.length),
      );
    }

    // Custom formatting with space as thousand separator
    final formatter = NumberFormat('#,##0.##', locale.toString());
    final formattedText = formatter.format(number).replaceAll(',', ' ');

    // Calculate new cursor position
    final spaceCount = ' '.allMatches(formattedText).length;
    final oldSpaceCount = ' '.allMatches(oldValue.text).length;
    final spaceDiff = spaceCount - oldSpaceCount;

    final newCursorPosition = (newValue.selection.baseOffset + spaceDiff).clamp(
      0,
      formattedText.length,
    );

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
