import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

class FlutterUtil {

  static final RegExp _dateRegExp = RegExp(
      r'^\d{4}[\-\/\.]((0[1-9])|(1[012]))[\-\/\.]((0[1-9]|[1-2][0-9]|3[0-1]))');

  static String dateString(String? dateString) {
    if (dateString == null) {
      return "";
    }
    String date = dateString;
    return _dateRegExp.stringMatch(date) ?? date;
  }

  static String getFirstLetterPinYin(String name) {
    return PinyinHelper.getFirstWordPinyin(name).substring(0, 1);
  }

  static Color nameColor(String name) {
    var letter = getFirstLetterPinYin(name).toUpperCase();
    var hash = letter.hashCode & 0xffff;
    var hue = 360 * hash / (1 << 15) % 360;
    return HSVColor.fromAHSV(1, hue, 0.3, 0.7).toColor();
  }
}
