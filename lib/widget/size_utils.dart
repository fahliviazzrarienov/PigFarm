// size_utils.dart
import 'package:flutter/material.dart';

class SizeUtils {
  static double doubleSizeWidth({bool? textField, required BuildContext context}) {
    return textField == null || textField == ""
        ? MediaQuery.of(context).size.width * 20 / 100
        : textField
        ? MediaQuery.of(context).size.width * 80 / 100
        : 1;
  }
  static double doubleSizeHeight({required double width, required BuildContext context}) {
    return width<=2460
        ? MediaQuery.of(context).size.height * 30 / 100
        :MediaQuery.of(context).size.height * 0 / 100;
  }

  static double doubleSizeBox({bool? width, required BuildContext context}) {
    return MediaQuery.of(context).size.width == 1080
        ? MediaQuery.of(context).size.width * 80 / 100
        : MediaQuery.of(context).size.width * 0 / 100;
  }
}
