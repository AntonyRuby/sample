import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
// Converts string of phone numbers into formatted string with hyphens
// input: 9876543210    => output: 98765-43210
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String buffer = "";
    String text = newValue.text.replaceAll("-", "");

    if (text.length > 5) {
      for (int i = 0; i < text.length; i++) {
        buffer = buffer + text[i];
        if ((i + 1) % 5 == 0) {
          buffer = buffer + "-";
        }
      }
    } else {
      return newValue;
    }

    return newValue.copyWith(
      text: buffer,
      selection: new TextSelection.collapsed(offset: buffer.length),
    );
  }
}
